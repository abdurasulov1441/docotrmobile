import 'package:doctormobile/style/app_colors.dart';
import 'package:doctormobile/style/app_style.dart';
import 'package:flutter/material.dart';

class ObjectFlatContainer extends StatelessWidget {
  const ObjectFlatContainer({
    super.key,
    required this.image,
    required this.text,
    required this.route,
  });
  final String image;
  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBackgroundColor,
      shape: RoundedRectangleBorder(
          side:
              const BorderSide(color: AppColors.lightIconGuardColor, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              width: 250,
              height: 250,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(route);
                },
                child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.lightIconGuardColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Text(
                          text,
                          style: AppStyle.fontStyle
                              .copyWith(color: AppColors.lightBackgroundColor),
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
