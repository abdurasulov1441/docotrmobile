import 'package:doctormobile/components/appbar_title.dart';
import 'package:doctormobile/screens/Pages_Basic/accaount_screens/shartnomalar.dart';
import 'package:doctormobile/screens/Pages_Basic/accaount_screens/visacard.dart';
import 'package:doctormobile/services/changeColorProvider.dart';
import 'package:doctormobile/style/app_colors.dart';
import 'package:doctormobile/style/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chiqish'),
          content: const Text('Haqiqatdan ham chiqmoqchimisiz?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Yo\'q'),
            ),
            TextButton(
              onPressed: () {
                signOut();
                Navigator.of(context).pop();
              },
              child: const Text('Chiqish'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final List name = [
      'Tarix',
      'Boshliqlarni kiritish',
      'Yordam',
      'Qorong\'u rejim',
      'Chiqish',
    ];
    final List image = [
      'shartnoma.svg',
      'havfsizlik.svg',
      'yordam.svg',
      'tungi_rejim.svg',
      'logout.svg',
    ];
    final List<Widget> route = [
      Shartnomalar(),
      Shartnomalar(),
      Shartnomalar(),
      Cards(),
      Shartnomalar(),
      Divider(),
      Shartnomalar(),
    ];
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/set.png',
              width: 100,
              height: 100,
            ),
            Text(
              'Toshkent viloyati QB',
              style: AppStyle.fontStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme
                      ? AppColors.darkTextColor
                      : AppColors.lightTextColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   'assets/images/house.png',
                //   width: 60,
                //   height: 60,
                // ),

                const SizedBox(
                  width: 20,
                  // height: 20,
                ),
                // Image.asset(
                //   'assets/images/lock.png',
                //   width: 60,
                //   height: 60,
                // ),
                // Image.asset(
                //   'assets/images/emerency_on.png',
                //   width: 60,
                //   height: 60,
                // )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        // leading: SvgPicture.asset(
                        //   'assets/images/${image[index]}',
                        //   width: 30,
                        //   height: 30,
                        // ),
                        // title: item.buildTitle(context),
                        // subtitle: item.buildSubtitle(context),
                        title: Text(
                          name[index],
                          style: AppStyle.fontStyle.copyWith(
                              color: themeProvider.isDarkTheme
                                  ? AppColors.darkTextColor
                                  : AppColors.lightTextColor),
                        ),
                        onTap: () {
                          print(name[index]);
                          if (name[index] == 'Chiqish') {
                            showLogoutDialog(context);
                          } else if (name[index] == 'Qorong\'u rejim') {
                            null;
                          } else {
                            pushWithoutNavBar(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => route[index]));
                          }
                        },
                        //leading: Image.asset(images[index],width: 50,height: 50,),
                        textColor: Colors.white,
                        trailing: name[index] == 'Qorong\'u rejim'
                            ? Switch(
                                value: themeProvider.isDarkTheme,
                                onChanged: (value) {
                                  themeProvider.toggleTheme();
                                },
                              )
                            : Icon(
                                Icons.keyboard_arrow_right,
                                color: themeProvider.isDarkTheme
                                    ? AppColors.darkTextColor
                                    : AppColors.lightTextColor,
                                weight: 20,
                              ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
