import 'package:flutter/material.dart';

class AppColors {
  static const Color bgColor = Color(0xFFdcdde2);
  static const Color themeColor = Color(0xFF2d2d2d);
  static const Color blackColor = Colors.black;
  static const Color accentColor = Color(0xFF249ac4);
  static const Color lightGreyColor = Color(0xFFcccccc);
  static const Color lightGreenColor = Color(0xFF00ac10);
  static const Color iconGreyColor = Color(0xFF999999);
}

const String iconFontFamily = 'hinch';
class AppIcons {
  static const IconData keysFrom = const IconData(0xe911, fontFamily: iconFontFamily);
  static const IconData keysTo = const IconData(0xe910, fontFamily: iconFontFamily);
  static const IconData location = const IconData(0xe90f, fontFamily: iconFontFamily);
  static const IconData user = const IconData(0xe90e, fontFamily: iconFontFamily);
  static const IconData timer = const IconData(0xe90d, fontFamily: iconFontFamily);
  static const IconData processing = const IconData(0xe90c, fontFamily: iconFontFamily);

  static const IconData delete = const IconData(0xe908, fontFamily: iconFontFamily);
  static const IconData cloud = const IconData(0xe909, fontFamily: iconFontFamily);
  static const IconData edit = const IconData(0xe903, fontFamily: iconFontFamily);

  static const IconData addImage = const IconData(0xe907, fontFamily: iconFontFamily);
  static const IconData blackImage = const IconData(0xe905, fontFamily: iconFontFamily);
  static const IconData disabledImage = const IconData(0xe905, fontFamily: iconFontFamily);

  static const IconData filter = const IconData(0xe90b, fontFamily: iconFontFamily);
  static const IconData attachment = const IconData(0xe902, fontFamily: iconFontFamily);

}

class AppTextStyle {
  static const TextStyle blackTextH5Bold = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle blackTextH5 = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 15.0,
  );
  static const TextStyle whiteTextH5Bold = const TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle whiteTextH5 = const TextStyle(
    color: Colors.white,
    fontSize: 15.0,
  );
  static const TextStyle blackTextH4 = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 16.0,
  );
  static const TextStyle blackTextH3 = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 17.0,
  );
  static const TextStyle blackTextH3Bold = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 17.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle accentTextH3Bold = const TextStyle(
    color: AppColors.accentColor,
    fontSize: 17.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle accentTextH3 = const TextStyle(
    color: AppColors.accentColor,
    fontSize: 17.0,
  );

}
