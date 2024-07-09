import 'package:doctormobile/screens/Pages_Basic/account_screen.dart';
import 'package:doctormobile/screens/Pages_Basic/kunlik.dart';
import 'package:doctormobile/screens/Pages_Basic/kiritilgan.dart';
import 'package:doctormobile/screens/auth_and_reg_pages/login_screen.dart';
import 'package:doctormobile/services/changeColorProvider.dart';
import 'package:doctormobile/style/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

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
              Icons.edit,
              color: AppColors.lightHeaderColor,
            ),
            title: "Kunlik",
          ),
        ),
        PersistentTabConfig(
          screen: const SendRequestSafingScreen(),
          item: ItemConfig(
            icon: const Icon(
              Icons.list,
              color: AppColors.lightHeaderColor,
            ),
            title: "Kiritilgan",
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

class HomePageElements extends StatelessWidget {
  const HomePageElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/images/doctor.jpg',
          width: 100,
          height: 100,
        )
      ],
    ));
  }
}
