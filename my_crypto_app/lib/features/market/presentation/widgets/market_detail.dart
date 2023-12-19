import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_crypto_app/core/data/models/coin_model.dart';


import '../../../../colors.dart';
import '../../../../core/core.dart';
import '../../../../text.dart';

import '../../../home/bloc/favorites/favorites_bloc.dart';
import '../../../home/presentation/widgets/price_change.dart';
import 'shimmer_tile.dart';

class MarketDetail extends StatefulWidget {
  CoinModel coin;
  MarketDetail({
    required this.coin,
    super.key,
  });

  @override
  State<MarketDetail> createState() => _MarketDetailState();
}

class _MarketDetailState extends State<MarketDetail> {
  bool isFavorite = false;

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
          //  Image.asset('assets/images/btc.png'),
          8.sp.widthBox,
          Expanded(
            child: SizedBox(
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
          ),
          24.5.sp.widthBox,
          Column(
            children: [
              Text(
                widget.coin.currentPrice.toString(),
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
          ),
          30.sp.widthBox,
          IconButton(
              onPressed: () {
                if (isFavorite) {
                  context
                      .read<FavoritesBloc>()
                      .add(RemoveFavoriteEvent(coin: widget.coin));
                } else {
                  context
                      .read<FavoritesBloc>()
                      .add(SaveFavoriteEvent(coin: widget.coin));
                }
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ))
        ],
      ),
    );
  }
}
