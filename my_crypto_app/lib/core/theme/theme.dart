import '../core.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF8F9FA),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(8.r),
    //     ),
    //     elevation: 0,
    //     backgroundColor: Colors.red,
    //     textStyle: xDS.xdsTypography.dynamicStyle(
    //       fontSize: 12.sp,
    //       height: 16 / 12,
    //       fontWeight: FontWeight.w500,
    //       color: Colors.white,
    //     ),
    //   ),
    // ),

    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     foregroundColor: xDS.colors.xDSAred6,
    //     textStyle: xDS.xdsTypography.dynamicStyle(
    //       fontSize: 12.sp,
    //       fontWeight: FontWeight.w500,
    //       height: 20 / 12,
    //       color: xDS.colors.xDSAred6,
    //     ),
    //   ),
    // ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      color: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xff2B2930),
      ),
    ),

    fontFamily: 'SF-Pro-Text',

    // inputDecorationTheme: InputDecorationTheme(
    //   // contentPadding: REdgeInsets.all(18),
    //   fillColor: Colors.white,
    //   filled: true,
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.r),
    //     borderSide: const BorderSide(
    //       color: Colors.grey,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.r),
    //     borderSide: const BorderSide(
    //       // color: xDS.colors.xDSCNeutral5,
    //       width: 2,
    //     ),
    //   ),
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.r),
    //     borderSide: const BorderSide(
    //         //    color: xDS.colors.xDSCNeutral5,
    //         ),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.r),
    //     borderSide: const BorderSide(
    //         //  color: xDS.colors.xDSAred6,
    //         ),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(8.r),
    //     borderSide: const BorderSide(
    //       //   color: xDS.colors.xDSAred6,
    //       width: 2,
    //     ),
    //   ),
    // ),
    textTheme: TextTheme(
        titleMedium: TextStyle(
            fontSize: 12.sp, height: 19 / 12, fontFamily: 'SF-Pro-Text')

        // xDS.xdsTypography
        //     .smRgBody12px()
        //     .copyWith(color: const Color(0xff8F8E91), height: 19 / 12),
        ),
  );
  static ThemeData dark = ThemeData(fontFamily: 'SF-Pro-Text');
}
