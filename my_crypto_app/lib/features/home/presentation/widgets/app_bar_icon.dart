import 'package:flutter_svg/svg.dart';

import '../../../../colors.dart';
import '../../../../core/core.dart';

class AppBarIcon extends StatelessWidget {
  final String image;

  const AppBarIcon({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.sp, bottom: 4.sp),
      height: 40.sp,
      width: 40.sp,
      decoration: BoxDecoration(
          color: AppColor.headerColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Center(
          child: SvgPicture.asset(
        image,
      )),
    );
  }
}
