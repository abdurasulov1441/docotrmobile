import 'package:doctormobile/components/mini_red_app_bar.dart';
import 'package:doctormobile/components/object_flat_container.dart';
import 'package:doctormobile/services/changeColorProvider.dart';
import 'package:doctormobile/style/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ObjectSecurity extends StatelessWidget {
  const ObjectSecurity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkTheme
          ? AppColors.darkBackgroundColor
          : AppColors.lightBackgroundColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MiniRedAppBar(),
            MiniRedTitle(
              title: 'Obyektingizni qo\'riqlovga topshiring',
            ),
            SizedBox(
              height: 25,
            ),
            ObjectFlatContainer(
                image: 'assets/images/default.png',
                text: 'Saf bo\'linmalari orqali qo\'riqlash',
                route: '/from_object'),
            ObjectFlatContainer(
                image: 'assets/images/default.png',
                text:
                    'Xarbiylashtirilgan qo\'riqlash bo\'linmalari orqali qo\'riqlash',
                route: 'SAF'),
            ObjectFlatContainer(
                image: 'assets/images/default.png',
                text: 'Qorovullik bo\'linmalari orqali qo\'riqlash',
                route: 'SAF'),
            ObjectFlatContainer(
                image: 'assets/images/default.png',
                text: 'Texnik qo\'riqlash markazlari orqali qo\'riqlash',
                route: 'SAF'),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
