

import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_crypto_app/colors.dart';
import 'package:my_crypto_app/core/data/models/coin_model.dart';
import 'package:my_crypto_app/features/home/bloc/favorites/favorites_bloc.dart';
import 'package:my_crypto_app/features/home/presentation/screens/controllers/coin_details.dart';
import 'package:my_crypto_app/text.dart';

import '../../../../../core/core.dart';
import '../../../../../core/helpers/widget_helper.dart';
import '../../../../market/presentation/widgets/shimmer_tile.dart';
import '../../../bloc/connect/connect_bloc.dart';
import '../../widgets/coin_detail.dart';
import '../contracts/portfolio.dart';

class PortfolioScreenView extends StatelessWidget
    implements PortfolioScreenViewContract {
  const PortfolioScreenView(this.controller, this.widgetHelper, {super.key});

  final IWidgetHelper widgetHelper;
  final PortfolioScreenControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              decoration: BoxDecoration(
                  color: AppColor.headerColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r))),
              height: 176.sp,
              width: double.maxFinite,
              child: Column(
                children: [
                  40.sp.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 42.sp,
                            width: 42.sp,
                            child: Image.asset('assets/images/pic.png'),
                          ),
                          8.w.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome Back',
                                style: MyText.small14(color: AppColor.darkGrey),
                              ),
                              4.h.heightBox,
                              Text(
                                'John',
                                style: MyText.medium18(),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                                color: AppColor.walletBackground,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/vectors/Wallet.svg',
                                width: 24.sp,
                                height: 24.sp,
                              ),
                            ),
                          ),
                          8.sp.widthBox,
                          Container(
                            height: 40.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                                color: AppColor.walletBackground,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                                child: SvgPicture.asset(
                                    'assets/vectors/Scan.svg')),
                          )
                        ],
                      )
                    ],
                  ),
                  18.sp.heightBox,
                  SizedBox(
                    height: 48.sp,
                    width: double.maxFinite,
                    child: TextFormField(
                      //controller: controller.searchController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: AppColor.backGround,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColor.backGround,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 4.sp),
                          child: Container(
                            margin: EdgeInsets.only(top: 4.sp, bottom: 4.sp),
                            height: 40.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                                color: AppColor.headerColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                                child: SvgPicture.asset(
                                    'assets/vectors/Filter.svg')),
                          ),
                        ),
                        prefixIcon: SvgPicture.asset(
                          'assets/vectors/Search.svg',
                          width: 15.sp,
                          height: 15.sp,
                          fit: BoxFit.none,
                        ),
                        hintText: 'Search...',
                        hintStyle: MyText.medium16(color: AppColor.hintText),
                      ),
                    ),
                  ),
                  12.h.heightBox,
                  Container(
                    height: 4.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                        color: AppColor.swipeWidget,
                        borderRadius: BorderRadius.circular(20.r)),
                  )
                ],
              ),
            ),
            24.sp.heightBox,
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16.sp),
                padding: EdgeInsets.only(top: 16.sp, left: 24.sp, right: 24.sp),
                height: 175.sp,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/card.png',
                        ),
                        fit: BoxFit.cover)),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 81.sp,
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Portfolio Value',
                                  style: MyText.small14(color: AppColor.white),
                                ),
                                8.sp.heightBox,
                                Text(
                                  '\$47,412.65',
                                  style: MyText.large24(),
                                ),
                                8.sp.heightBox,
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/vectors/arrow-up.svg'),
                                    4.sp.widthBox,
                                    Text(
                                      '\$453.85(+1.6%)',
                                      style:
                                          MyText.small12(color: AppColor.green),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.sp),
                              child: SizedBox(
                                  width: 84.sp,
                                  height: 35.sp,
                                  child: Image.asset(
                                    'assets/images/chart_up.png',
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    18.sp.heightBox,
                    Image.asset('assets/images/divider.png'),
                    18.sp.heightBox,
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: SizedBox(
                        height: 17.sp,
                        width: 66.sp,
                        child: Row(
                          children: [
                            Text(
                              'See All',
                              style: MyText.small14(color: AppColor.hintText),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.sp,
                              color: AppColor.hintText,
                            )
                            // IconButton(
                            //     onPressed: () {},
                            //     icon: Icon(
                            //       Icons.arrow_forward_ios,
                            //       size: 16.sp,
                            //     ))
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            20.sp.heightBox,
            Padding(
              padding: EdgeInsets.only(left: 16.sp),
              child: Text(
                'Watchlist',
                style: MyText.medium18(fontWeight: FontWeight.w400),
              ),
            ),
            12.sp.heightBox,
            BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesListLoaded) {
                  List<CoinModel> favoriteCoins = state.favorites;
                  return favoriteCoins.isNotEmpty
                      ? SizedBox(
                          height: 395.sp,
                          width: double.maxFinite,
                          child: ListView.builder(
                              itemCount: favoriteCoins.length,
                              itemBuilder: (ctx, index) {
                                return InkWell(
                                    onTap: () {
                                      context.push(CoinDetailsScreen.route,
                                          extra: favoriteCoins[index]);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.sp),
                                      child: CoinDetail(
                                        coin: favoriteCoins[index],
                                        myBloc: ConnectBloc(
                                            url: favoriteCoins[index].symbol),
                                      ),
                                    ));
                              }),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 100.sp,
                                  color: AppColor.white,
                                ),
                                32.h.heightBox,
                                Text('Your Favorites list is empty',
                                    style:
                                        MyText.medium16(color: AppColor.white)),
                                10.heightBox,
                              ],
                            ),
                          ),
                        );
                }
                if (state is FavoritesLoading) {
                  return SizedBox(
                    height: 395.sp,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        const ShimmerTile(),
                        10.sp.heightBox,
                        const ShimmerTile(),
                        10.sp.heightBox,
                        const ShimmerTile(),
                        10.sp.heightBox,
                      ],
                    ),
                  );
                }
                return Container(
                  child: const Center(child: Text('here')),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
