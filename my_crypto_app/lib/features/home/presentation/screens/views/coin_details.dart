import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_crypto_app/features/home/bloc/connect/connect_bloc.dart';

import '../../../../../colors.dart';
import '../../../../../core/core.dart';
import '../../../../../core/data/models/chart_model.dart';
import '../../../../../core/data/models/coin_model.dart';
import '../../../../../core/helpers/widget_helper.dart';
import '../../../../../text.dart';
import '../../../../market/bloc/coin_detail/coin_detail_bloc.dart';
import '../../../../market/presentation/widgets/shimmer_tile.dart';
import '../../../bloc/chart/chart_bloc.dart';
import '../../widgets/app_bar_icon.dart';
import '../../widgets/market_button.dart';
import '../../widgets/price_change.dart';
import '../../widgets/select_period.dart';
import '../../widgets/watch.dart';
import '../contracts/coin_details.dart';

class CoinDetailsScreenView extends StatelessWidget
    implements CoinDetailsScreenViewContract {
  const CoinDetailsScreenView(this.controller, this.widgetHelper, {super.key});

  final IWidgetHelper widgetHelper;
  final CoinDetailsScreenControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.sp,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //  mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: const AppBarIcon(
                          image: 'assets/vectors/arrow-left.svg')),
                  Row(
                    children: [
                      SizedBox(
                        width: 24.sp,
                        height: 24.sp,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: controller.coin.image,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/images/btc.png'),
                            placeholder: (ctx, url) {
                              return const ShimmerTile().clipper(radius: 100.r);
                            },
                          ),
                        ),
                      ),
                      Text(
                        '${controller.coin.symbol.toUpperCase()}/USDT',
                        style: MyText.medium18(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: const AppBarIcon(
                        image: 'assets/vectors/candle_icon.svg'),
                  ),
                ],
              ),
            ),
            28.sp.heightBox,
            SizedBox(
              height: 60.sp,
              child: Row(
                children: [
                  Container(
                    width: 6.sp,
                    height: 60.sp,
                    decoration: BoxDecoration(
                        color: AppColor.green,
                        borderRadius: BorderRadius.circular(20.r)),
                  ),
                  12.sp.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<ConnectBloc, ConnectState>(
                        bloc: controller.bloc,
                        builder: (context, state) {
                          if (state is Connected) {
                            String price = state.price;
                            return Text(
                              double.parse(price).toStringAsFixed(5),
                              style: MyText.large24(fontSize: 32),
                            );
                          }
                          return Container();
                        },
                      ),
                      const Expanded(
                        child: PriceChange(
                          isPositive: true,
                          text: '105 (%0.8)',
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            13.sp.heightBox,
            SizedBox(
              width: double.maxFinite,
              height: 24.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  10.sp.widthBox,
                  InkWell(
                      onTap: () {
                        controller.onPeriodSelected(0);
                        controller.getChart(
                            '1', controller.coin.name.toLowerCase());
                      },
                      child: SelectPeriod(
                          text: '24H',
                          isSelected: controller.periodSelected == 0)),
                  InkWell(
                      onTap: () {
                        controller.onPeriodSelected(1);
                        controller.getChart(
                            '7', controller.coin.name.toLowerCase());
                      },
                      child: SelectPeriod(
                          text: '1W',
                          isSelected: controller.periodSelected == 1)),
                  InkWell(
                      onTap: () {
                        controller.onPeriodSelected(2);
                        controller.getChart(
                            '30', controller.coin.name.toLowerCase());
                      },
                      child: SelectPeriod(
                          text: '1M',
                          isSelected: controller.periodSelected == 2)),
                  InkWell(
                      onTap: () {
                        controller.onPeriodSelected(3);
                        controller.getChart(
                            '90', controller.coin.name.toLowerCase());
                      },
                      child: SelectPeriod(
                          text: '1Y',
                          isSelected: controller.periodSelected == 3)),
                  InkWell(
                      onTap: () {
                        controller.onPeriodSelected(4);
                        controller.getChart('180', controller.coin.name);
                      },
                      child: SelectPeriod(
                          text: 'All',
                          isSelected: controller.periodSelected == 4))
                ],
              ),
            ),
            12.sp.heightBox,
            BlocBuilder<ChartBloc, ChartState>(
              builder: (context, state) {
                if (state is ChartLoaded) {
                  List<ChartModel> ohlcList = state.ohlc;
                  return SizedBox(
                      height: 227.sp,
                      width: double.maxFinite,
                      child: LineChart(
                        LineChartData(
                          minX:
                              ohlcList.first.time.toDouble(), // Minimum X value
                          maxX:
                              ohlcList.last.time.toDouble(), // Maximum X value
                          minY: ohlcList.map((e) => e.low).reduce(
                              (a, b) => a! < b! ? a : b), // Minimum Y value
                          maxY: ohlcList.map((e) => e.high).reduce(
                              (a, b) => a! > b! ? a : b), // Maximum Y value
                          gridData: const FlGridData(
                              show: true, drawVerticalLine: true),
                          titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      '${(value / 1000).toStringAsFixed(0)}K',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 10.sp),
                                    );
                                  },
                                ),
                              ),
                              bottomTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                showTitles: true,
                                // getTitlesWidget: (value, meta) {
                                //   return const Column(
                                //     children: [Text('Mon'), Text('14')],
                                //   );
                                // },
                              ))),
                          borderData: FlBorderData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              spots: ohlcList
                                  .map((e) => FlSpot(
                                      e.time.toDouble(),
                                      (e.high! + e.low!) /
                                          2)) // Use the average of High and Low as Y value
                                  .toList(),
                              //  [
                              //   const FlSpot(0, 10000),
                              //   const FlSpot(1, 12000),
                              //   const FlSpot(2, 15000),
                              //   const FlSpot(3, 11000),
                              //   // Add more data points here
                              // ],
                              isCurved: true,
                              // colors: [Colors.blue],
                              dotData: const FlDotData(show: false),
                              color: AppColor.green,
                              belowBarData: BarAreaData(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color.fromRGBO(
                                        50, 82, 66, 1.0), // Brighter Green
                                    Color.fromRGBO(
                                        25, 41, 33, 1.0), // Original Green
                                    Color.fromRGBO(18, 33, 50, 1.0), // Blue
                                  ],
                                ),
                                show: true,
                                //  color: const Color.fromARGB(255, 140, 223, 140)
                              ),
                            ),
                          ],
                        ),
                      )

                      // child: Image.asset(
                      //   'assets/images/chart.png',
                      //   fit: BoxFit.fill,
                      // ),
                      );
                }
                if (state is ChartLoading) {
                  return SizedBox(
                      height: 227.sp,
                      width: double.maxFinite,
                      child: const ShimmerTile());
                }
                if (state is ChartLoadingError) {
                  return SizedBox(
                    height: 227.sp,
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        'No data Available',
                        style: MyText.large24(),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
            32.63.sp.heightBox,
            SizedBox(
              width: double.maxFinite,
              child: Center(
                child: SizedBox(
                  width: 283.sp,
                  child: Row(
                    children: [
                      const MarketButton(
                        color: AppColor.green,
                        text: 'Buy',
                      ),
                      13.sp.widthBox,
                      const MarketButton(color: AppColor.red, text: 'Sell')
                    ],
                  ),
                ),
              ),
            ),
            24.sp.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quick watch',
                  style: MyText.small14(color: AppColor.hintText),
                ),
                Row(
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
              ],
            ),
            18.sp.heightBox,
            Expanded(
              child: BlocBuilder<CoinDetailBloc, CoinDetailState>(
                builder: (context, state) {
                  if (state is CoinDetailLoaded) {
                    List<CoinModel> favoriteCoins = state.coinList;

                    return SizedBox(
                      height: 236.sp,
                      width: double.maxFinite,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (ctx, index) {
                            return InkWell(
                                onTap: () {
                                  //context.push(CoinDetailsScreen.route);
                                },
                                child: Watch(
                                  coin: favoriteCoins[index],
                                ));
                          }),
                    );
                  }
                  if (state is CoinDetailLoading) {
                    SizedBox(
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
              ),
            )
          ],
        ),
      )),
    );
  }
}
