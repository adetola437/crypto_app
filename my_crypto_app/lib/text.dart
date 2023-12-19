import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_crypto_app/colors.dart';
import 'package:my_crypto_app/core/core.dart';

class MyText {
  static TextStyle splash({Color? color}) {
    return GoogleFonts.bellota(
      color: color,
      fontSize: 25.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle small14(
      {Color? color,
      int? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle}) {
    return TextStyle(
       overflow: TextOverflow.ellipsis,
      color: color,
      fontSize: (fontSize ?? 14).sp,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle medium18(
      {Color? color,
      int? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle}) {
    return TextStyle(
       overflow: TextOverflow.ellipsis,
      color: color ?? AppColor.white,
      fontSize: (fontSize ?? 18).sp,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle medium16(
      {Color? color,
      int? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle}) {
    return TextStyle(
       overflow: TextOverflow.ellipsis,
      color: color ?? AppColor.white,
      fontSize: (fontSize ?? 16).sp,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle large24(
      {Color? color,
      int? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle}) {
    return TextStyle(
       overflow: TextOverflow.ellipsis,
      color: color ?? AppColor.white,
      fontSize: (fontSize ?? 24).sp,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }
   static TextStyle small12(
      {Color? color,
      int? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle}) {
    return TextStyle(
      overflow: TextOverflow.ellipsis,
      color: color ?? AppColor.white,
      fontSize: (fontSize ?? 12).sp,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  // static TextStyle onboard({Color? color}) {
  //   return GoogleFonts.beVietnamPro(
  //     color: color,
  //     fontSize: 45.sp,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: FontWeight.w500,
  //   );
  // }

  // static TextStyle onboardText({Color? color}) {
  //   return GoogleFonts.beVietnamPro(
  //     color: color,
  //     fontSize: 14.sp,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: FontWeight.w400,
  //   );
  // }

  // static TextStyle heading({Color? color}) {
  //   return GoogleFonts.beVietnamPro(
  //     color: color,
  //     fontSize: 20.sp,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: FontWeight.w500,
  //   );
  // }
  //  static TextStyle sub({Color? color}) {
  //   return GoogleFonts.beVietnamPro(
  //     color: color,
  //     fontSize: 25.sp,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: FontWeight.w500,
  //   );
  // }

  // static TextStyle head({Color? color}) {
  //   return GoogleFonts.beVietnamPro(
  //     color: color,
  //     fontSize: 16.sp,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: FontWeight.w500,
  //   );
  // }

  // static TextStyle small({Color? color}) {
  //   return GoogleFonts.beVietnamPro(
  //     color: color,
  //     fontSize: 12.sp,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: FontWeight.w500,
  //   );
  // }
  //   static TextStyle welcome({Color? color}) {
  //   return GoogleFonts.inter(
  //     color: color,
  //     fontSize: 14.sp,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: FontWeight.w500,
  //   );
  // }
}
