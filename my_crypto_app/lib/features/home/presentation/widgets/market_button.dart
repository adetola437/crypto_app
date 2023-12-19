import '../../../../colors.dart';
import '../../../../core/core.dart';
import '../../../../text.dart';

class MarketButton extends StatelessWidget {
  final String text;
 final Color color;
  const MarketButton({
    required this.color,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                fixedSize: Size(135.sp, 45.sp),
                backgroundColor: color),
            onPressed: () {},
            child: Text(
              text,
              style: MyText.medium18(),
            ))
      ],
    );
  }
}
