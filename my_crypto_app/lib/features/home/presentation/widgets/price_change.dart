import 'package:flutter_svg/svg.dart';

import '../../../../colors.dart';
import '../../../../core/core.dart';

class PriceChange extends StatelessWidget {
  final int? fontSize;
  final String text;
  final bool isPositive;
  const PriceChange({
    this.fontSize,
    required this.text,
    required this.isPositive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 16.sp,
          height: 16.sp,
          child: SvgPicture.asset(
            isPositive ?
            'assets/vectors/arrow-up.svg':'assets/vectors/arrow-bottom.svg',
          ),
        ),
        4.sp.widthBox,
        Text(
          text,
          style: TextStyle(
            height: 21.sp / 12.sp,
            letterSpacing: -0.24,
            fontSize: (fontSize ?? 12).sp,
            color:isPositive ? AppColor.green : Colors.red,
          ),
        )
      ],
    );
  }
}
