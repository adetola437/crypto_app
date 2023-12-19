import '../../../../colors.dart';
import '../../../../core/core.dart';
import '../../../../text.dart';

class SelectPeriod extends StatelessWidget {
  
  final String text;
  final bool isSelected;
  const SelectPeriod({
    required this.text,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.sp,
      height: 24.sp,
      decoration: BoxDecoration(
          color:isSelected ? AppColor.headerColor : AppColor.backGround,
          borderRadius: BorderRadius.circular(5.r)),
      child: Center(
        child: Text(
          text,
          style: MyText.small12(fontSize: 10),
        ),
      ),
    );
  }
}
