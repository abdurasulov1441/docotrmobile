import 'package:doctormobile/components/mini_red_app_bar.dart';
import 'package:doctormobile/services/changeColorProvider.dart';
import 'package:doctormobile/style/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FlatSecurity extends StatelessWidget {
  const FlatSecurity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkTheme
          ? AppColors.darkBackgroundColor
          : AppColors.lightBackgroundColor,
      body: const Column(
        children: [
          MiniRedAppBar(),
          MiniRedTitle(
            title: 'Xonadoningizni qo\'riqlovga topshiring',
          ),

          // Image.asset(
          //   'assets/images/saf_bilan.png',
          //   width: 500,
          //   height: 500,
          // ),
        ],
      ),
    );
  }
}
