import 'package:cached_network_image/cached_network_image.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:my_crypto_app/features/home/bloc/connect/connect_bloc.dart';

import '../../../../colors.dart';
import '../../../../core/core.dart';
import '../../../../core/data/models/coin_model.dart';
import '../../../../text.dart';
import '../../../market/presentation/widgets/shimmer_tile.dart';
import 'price_change.dart';

class Watch extends StatefulWidget {
  final CoinModel coin;
  const Watch({
    required this.coin,
    super.key,
  });

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  ConnectBloc? bloc;
  @override
  void initState() {
    bloc = ConnectBloc(url: widget.coin.symbol);
    super.initState();
  }

  @override
  void dispose() {
    bloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.sp),
      padding: EdgeInsets.all(12.sp),
      height: 74.sp,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColor.coinBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 40.sp,
              height: 40.sp,
              child: CachedNetworkImage(
                imageUrl: widget.coin.image,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/btc.png'),
                placeholder: (ctx, url) {
                  return const ShimmerTile().clipper(radius: 100.r);
                },
              )),
          8.sp.widthBox,
          SizedBox(
            width: 69.75.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.coin.name,
                  style: MyText.medium16(fontWeight: FontWeight.w500),
                ),
                5.sp.heightBox,
                Text(
                  widget.coin.symbol,
                  style: TextStyle(
                    height: 21.sp / 12.sp,
                    letterSpacing: -0.24,
                    fontSize: 12.sp,
                    color: AppColor.hintText,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 83.sp,
            height: 35.sp,
            child: Sparkline(
              data: widget.coin.sparklineIn7D.price,
              lineWidth: 2.0,
              lineColor: widget.coin.marketCapChangePercentage24H >= 0
                  ? Colors.green
                  : Colors.red,
              fillMode: FillMode.below,
              fillGradient: LinearGradient(
                  colors: widget.coin.marketCapChangePercentage24H >= 0
                      ? [
                          AppColor.green.withOpacity(1),
                          AppColor.green.withOpacity(0.2)
                        ]
                      : [
                          AppColor.red.withOpacity(1),
                          AppColor.red.withOpacity(0.2)
                        ],
                  stops: const [
                    0.2,
                    0.8,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          24.5.sp.widthBox,
          Column(
            children: [
              Text(
                widget.coin.currentPrice.toStringAsFixed(2),
                style: MyText.medium16(fontWeight: FontWeight.w500),
              ),
              6.sp.widthBox,
              PriceChange(
                isPositive: widget.coin.marketCapChangePercentage24H >= 0,
                text: widget.coin.marketCapChangePercentage24H >= 0
                    ? '+${widget.coin.marketCapChangePercentage24H.toStringAsFixed(2)}%'
                    : '${widget.coin.marketCapChangePercentage24H.toStringAsFixed(2)}%',
              )
            ],
          )
        ],
      ),
    );
  }
}
