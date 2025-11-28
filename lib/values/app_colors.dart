import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Color creditColor = Color(0xff339943);
  static const Color blackFont = Color(0xff172B4D);
  static const Color debitColor = Color(0xffB71428);
  static const Color colorPrimary = Color(0xff0000DC);
  static const Color colorPrimaryLight = Color(0x900000DC);

  static const Color colorSecondary = Color(0xff681A29);
  static const Color colorWhite = Color(0xffFFFFFF);
  static const Color disableTimeBGSlot = Color(0xffFFFFFF);
  static const Color dropDownSearchBg = Color(0xffEEF1F4);
  static const Color colorWhiteLight = Color(0xffE5E5E5);
  static const Color dividerLineColor = Color(0xffB9B9B9);
}

extension HexColor on Color {
  static Color fromHex(String colorCode) {
    colorCode = colorCode.replaceAll("#", '');
    if (colorCode.length == 6) {
      colorCode = "FF$colorCode";
    }
    return Color(int.parse("0x$colorCode"));
  }

  static Color fromHexWithOpacity(String colorCode, {double opacity = 1.0}) {
    colorCode = colorCode.replaceAll("#", '');
    if (colorCode.length == 6) {
      colorCode = "FF$colorCode";
    }
    int colorValue = int.parse("0x$colorCode");
    return Color.fromRGBO((colorValue >> 16) & 0xFF, (colorValue >> 8) & 0xFF, colorValue & 0xFF, opacity);
  }
}

class ThemeNames {
  static final light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.colorWhite,
    cardColor: AppColors.colorWhite,

    primaryColor: AppColors.colorPrimary,
    // buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
    cardTheme: const CardThemeData(surfaceTintColor: Colors.white),
    dialogTheme: const DialogThemeData(surfaceTintColor: Colors.white, backgroundColor: AppColors.colorWhite),

    textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.blackFont, selectionColor: AppColors.blackFont, selectionHandleColor: AppColors.blackFont),
    //  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppColors.colorLightBottomNavigationBar),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.colorWhite,
        side: const BorderSide(color: AppColors.colorPrimary, width: 1),
        foregroundColor: AppColors.colorPrimary,
        textStyle: TextStyle(color: AppColors.colorPrimary, fontSize: 14.sp, fontWeight: FontWeight.w700),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: AppColors.colorWhite, backgroundColor: AppColors.colorWhite),
  );
}

//100% - FF
// 95% - F2
// 90% - E6
// 85% - D9
// 80% - CC
// 75% - BF
// 70% - B3
// 65% - A6
// 60% - 99
// 55% - 8C
// 50% - 80
// 45% - 73
// 40% - 66
// 35% - 59
// 30% - 4D
// 25% - 40
// 20% - 33
// 15% - 26
// 10% - 1A
// 5% - 0D
// 0% - 00
