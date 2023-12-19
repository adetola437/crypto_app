import 'package:my_crypto_app/core/data/models/coin_model.dart';
import 'package:my_crypto_app/features/market/presentation/widgets/shimmer_tile.dart';

import '../../../../../colors.dart';
import '../../../../../core/core.dart';
import '../../../../../core/helpers/widget_helper.dart';
import '../../../../../text.dart';
import '../../../../home/presentation/widgets/app_bar_icon.dart';
import '../../../bloc/coin_detail/coin_detail_bloc.dart';
import '../../widgets/market_detail.dart';
import '../contracts/market.dart';

class MarketScreenView extends StatelessWidget
    implements MarketScreenViewContract {
  const MarketScreenView(this.controller, this.widgetHelper, {super.key});

  final IWidgetHelper widgetHelper;
  final MarketScreenControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              SizedBox(
                height: 40.sp,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppBarIcon(image: 'assets/vectors/arrow-left.svg'),
                    Text(
                      'Market',
                      style: MyText.medium18(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 40.sp,
                      width: 40.sp,
                    ),
                  ],
                ),
              ),
              BlocBuilder<CoinDetailBloc, CoinDetailState>(
                builder: (context, state) {
                  if (state is CoinDetailLoaded) {
                    List<CoinModel> coinList = state.coinList;
                    return SizedBox(
                      height: 750.sp,
                      width: double.maxFinite,
                      child: RefreshIndicator(
                        onRefresh: () {
                          return controller.refreshData();
                        },
                        child: ListView.builder(
                            itemCount: coinList.length,
                            itemBuilder: (ctx, index) {
                              return MarketDetail(
                                coin: coinList[index],
                              );
                            }),
                      ),
                    );
                  } else if (state is CoinDetailLoading) {
                    return SizedBox(
                      height: 750.sp,
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          const ShimmerTile(),
                          10.sp.heightBox,
                          const ShimmerTile(),
                          10.sp.heightBox,
                          const ShimmerTile(),
                          10.sp.heightBox,
                          const ShimmerTile(),
                          10.sp.heightBox,
                          const ShimmerTile(),
                          10.sp.heightBox,
                          const ShimmerTile(),
                          10.sp.heightBox,
                          const ShimmerTile(),
                          10.sp.heightBox,
                          const ShimmerTile(),
                          10.sp.heightBox,
                          const ShimmerTile(),
                          10.sp.heightBox,
                        ],
                      ),
                    );
                  } else if (state is CoinDetailError) {
                    return RefreshIndicator(
                      onRefresh: controller.refreshData,
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 750.sp,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               IconButton(onPressed: (){
                                controller.refreshData();
                               }, icon:  Icon(
                                  Icons.error,
                                  size: 100.sp,
                                  color: AppColor.red,
                                ),),
                                32.h.heightBox,
                                Text('An error occured, tap to refresh',
                                    style:
                                        MyText.medium16(color: AppColor.white)),
                                10.heightBox,
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Container(
                    child: const Center(
                      child: Text('An error occurred'),
                    ),
                  );
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
