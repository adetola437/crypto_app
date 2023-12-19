import 'package:h3m_shimmer_card/h3m_shimmer_card.dart';

import '../../../../colors.dart';
import '../../../../core/core.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      width: 375.w,
      height: height ?? 70.h,
      beginAlignment: Alignment.topLeft,
      endAlignment: Alignment.bottomRight,
      backgroundColor:AppColor.hintText.withOpacity(0.05),
      shimmerColor: AppColor.hintText.withOpacity(0.1),
    );
  }
}
