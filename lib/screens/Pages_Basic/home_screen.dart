import 'package:doctormobile/components/appbar_title.dart';
import 'package:doctormobile/screens/Pages_Basic/account_screen.dart';
import 'package:doctormobile/screens/Pages_Basic/news_screen.dart';
import 'package:doctormobile/screens/Pages_Basic/tarifs_screen.dart';
import 'package:doctormobile/screens/auth_and_reg_pages/login_screen.dart';
import 'package:doctormobile/services/changeColorProvider.dart';
import 'package:doctormobile/style/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:video_player/video_player.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: themeProvider.isDarkTheme
            ? AppColors.lightBackgroundColor
            : AppColors.darkBackgroundColor,
        body: (user == null) ? const LoginScreen() : const BottomNavBar());
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomePageElements(),
          item: ItemConfig(
            icon: const Icon(
              Icons.home,
              color: AppColors.lightHeaderColor,
            ),
            title: "Sahifa",
          ),
        ),
        PersistentTabConfig(
          screen: const NewsScreen(),
          item: ItemConfig(
            icon: const Icon(
              Icons.newspaper,
              color: AppColors.lightHeaderColor,
            ),
            title: "Yangiliklar",
          ),
        ),
        PersistentTabConfig(
          screen: const SendRequestSafingScreen(),
          item: ItemConfig(
            icon: const Icon(
              Icons.book,
              color: AppColors.lightHeaderColor,
            ),
            title: "Tariflar",
          ),
        ),
        PersistentTabConfig(
          screen: const AccountScreen(),
          item: ItemConfig(
              icon: const Icon(
                Icons.person,
                color: AppColors.lightHeaderColor,
              ),
              title: "Kabinet",
              activeColorSecondary: AppColors.lightHeaderColor),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        popAllScreensOnTapAnyTabs: true,
        popActionScreens: PopActionScreensType.all,
        screenTransitionAnimation:
            const ScreenTransitionAnimation(duration: Duration(seconds: 1)),
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarDecoration:
              const NavBarDecoration(color: AppColors.lightIconGuardColor),
          navBarConfig: navBarConfig,
        ),
      );
}

class HomePageElements extends StatefulWidget {
  const HomePageElements({super.key});

  @override
  State<HomePageElements> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<HomePageElements> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controllerUZ;
  late VideoPlayerController _controllerRU;
  @override
  void initState() {
    super.initState();
    _controllerUZ = VideoPlayerController.asset(
      'assets/videos/uz.mp4',
    );
    _controllerRU = VideoPlayerController.asset(
      'assets/videos/ru.mp4',
    );
    _controller = _controllerUZ;
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerUZ.dispose();
    _controllerRU.dispose();
    super.dispose();
  }

  void switchLanguage(String language) {
    setState(() {
      if (language == "RU") {
        _controller = _controllerRU;
      } else {
        _controller = _controllerUZ;
      }
      _controller.initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarTitle(),
          Column(
            children: <Widget>[
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator())),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => switchLanguage("UZ"),
                    child: const Text('UZ'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => switchLanguage("RU"),
                    child: const Text('RU'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
