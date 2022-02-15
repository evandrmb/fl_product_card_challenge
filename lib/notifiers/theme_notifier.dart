import 'package:flutter/material.dart';
import 'package:product_card_challenge/theme/colors.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    textTheme = const TextTheme(
      headline1: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: AppColors.mineShaft,
      ),
      headline2: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.mineShaft,
      ),
      headline3: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.mineShaft,
      ),
      button: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.mineShaft,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.mineShaft,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.mineShaft,
      ),
      bodyText2: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.mineShaft,
      ),
    );
  }

  late TextTheme textTheme;

  void setTextTheme(Size size) {}
}
