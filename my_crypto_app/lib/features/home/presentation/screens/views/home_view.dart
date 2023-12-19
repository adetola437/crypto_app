import 'dart:ui';

import 'package:flutter_svg/svg.dart';

import '../../../../../core/core.dart';
import '../../../../../core/helpers/widget_helper.dart';
import '../../../../market/presentation/screens/controllers/market.dart';
import '../contracts/home_contract.dart';
import '../controllers/home_controller.dart';
import '../controllers/portfolio.dart';

class HomeView extends StatelessWidget implements HomeViewContract {
  final IWidgetHelper widgetHelper;
  final HomeControllerContract controller;
  const HomeView(this.controller, this.widgetHelper, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   backgroundColor: AppColor.backGround,
        //   resizeToAvoidBottomInset: true,
        //  extendBody: true,
        // floatingActionButton: ClipOval(
        //   child: Material(
        //     color: Colors.blue, // Set the background color
        //     child: Container(
        //       decoration: const BoxDecoration(
        //           image: DecorationImage(
        //               image: AssetImage('assets/vectors/floating_back.png'))),
        //       child: SizedBox(
        //           width: 70.0.sp,
        //           height: 70.0.sp,
        //           child: Center(
        //             child: SizedBox(
        //                 width: 32.sp,
        //                 height: 32.sp,
        //                 child: SvgPicture.asset(
        //                   'assets/vectors/plus.svg',
        //                   width: 32.sp,
        //                   height: 32.sp,
        //                 )),
        //           )),
        //     ),
        //   ),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: ClipRect(
        //   child: Container(
        //     color: Colors.transparent,
        //     height: 79.h,
        //     child: BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        //       child: ValueListenableBuilder(
        //         valueListenable: homeIndex,
        //         builder: (context, value, widget) {
        //           return Padding(
        //             padding: EdgeInsets.symmetric(horizontal: 66.w),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 _bottomBarItem(
        //                   'assets/vectors/Home.svg',
        //                   value == 0,
        //                   onTap: () {
        //                     controller.onItemTapped(0);
        //                   },
        //                 ),
        //                 _bottomBarItem(
        //                   'assets/vectors/market.svg',
        //                   value == 1,
        //                   onTap: () {
        //                     controller.onItemTapped(1);
        //                   },
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //   ),
        // ),
        body: ValueListenableBuilder(
            valueListenable: homeIndex,
            builder: (context, value, widget) {
              return Stack(
                children: [
                  IndexedStack(
                    index: value,
                    children: const [PortfolioScreen(), MarketScreen()],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      child: Container(
                        height: 79.sp,
                        color: Colors.transparent,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: ValueListenableBuilder(
                            valueListenable: homeIndex,
                            builder: (context, value, widget) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 66.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _bottomBarItem(
                                      'assets/vectors/Home.svg',
                                      value == 0,
                                      onTap: () {
                                        controller.onItemTapped(0);
                                      },
                                    ),
                                    _bottomBarItem(
                                      'assets/vectors/market.svg',
                                      value == 1,
                                      onTap: () {
                                        controller.onItemTapped(1);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50.sp,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 70.0.sp,
                      height: 70.0.sp,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r)),
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/floating_back.png'))),
                      child: SizedBox(
                          width: 70.0.sp,
                          height: 70.0.sp,
                          child: Center(
                            child: SizedBox(
                                width: 32.sp,
                                height: 32.sp,
                                child: SvgPicture.asset(
                                  'assets/vectors/plus.svg',
                                  width: 32.sp,
                                  height: 32.sp,
                                )),
                          )),
                    ),
                  ),
                ],
              );
            }));
  }

  _bottomBarItem(String image, bool selected, {required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SvgPicture.asset(
        image,
        placeholderBuilder: (context) => const Icon(Icons.home_filled),
        color: selected ? Colors.red : Colors.white,
        height: 26.8.sp,
        width: 25.3.sp,
      ),
    );
  }
}
