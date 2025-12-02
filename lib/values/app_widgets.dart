import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/values/strings_name.dart';

import 'app_colors.dart';

class AppWidgets {
  static Widget commonText(
    String text, {
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.ellipsis,
    double fontSize = 10,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.white,
    String fontFamily = StringNames.fontFamilyLobster,
    double? letterSpacing = 10 * (-2 / 100),
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize, fontFamily: fontFamily, letterSpacing: letterSpacing),
    );
  }

  // static Widget divider({double heights = 1, Color colors = AppColors.dividerLineColor}) {
  //   return SizedBox(
  //       width: 50.w,
  //       child: Divider(height: heights, color: colors,));
  // }
  static double getResponsiveFont(double size) {
    if (kIsWeb) {
      return (size.sp).clamp(size, size + 4); // Smooth scaling
    }
    return size.sp; // Mobile normal
  }
  static Widget commonTextAvenir(
    String text, {
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.ellipsis,
    double fontSize = 10,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.black,
    String fontFamily = StringNames.fontFamily,
    double? letterSpacing = 10 * (-2 / 100),
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize, fontFamily: fontFamily, letterSpacing: letterSpacing),
    );
  }

  static Widget commonContainer(String text, Function()? onTapItem) {
    return GestureDetector(
      onTap: onTapItem,
      child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), bottomRight: Radius.circular(25.r), topRight: Radius.circular(5.r), bottomLeft: Radius.circular(5.r)),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.sp, fontFamily: StringNames.fontFamily, letterSpacing: 16.sp * (-2 / 100)),
        ),
      ),
    );
  }
}
