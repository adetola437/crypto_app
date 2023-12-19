// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:timeago/timeago.dart';


import '../../features/market/presentation/widgets/shimmer_tile.dart';
import '../core.dart';
import '../security/cryptosystem/cryptosystem.dart';

extension StringExtensions on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get gif => 'assets/images/$this.gif';
  String get svg => 'assets/svgs/$this.svg';
  SvgPicture svgPicture(
          {double? width, double? height, Color? color, BoxFit? fit}) =>
      SvgPicture.asset(
        'assets/vectors/$this.svg',
        width: width,
        height: height,
        fit: fit ?? BoxFit.none,
        color: color,
      );

  Image pngPicture(
          {double? width,
          double? height,
          BoxFit? fit,
          AnimationController? animation}) =>
      Image.asset(
        'assets/images/$this.png',
        width: width,
        frameBuilder: animation == null
            ? null
            : (context, child, frame, wasSynchronouslyLoaded) =>
                FadeTransition(opacity: animation, child: child),
        height: height,
        fit: fit,
      );
  Image gifPicture({double? width, double? height, BoxFit? fit}) => Image.asset(
        'assets/animations/$this.gif',
        width: width,
        height: height,
        fit: fit,
      );

  CachedNetworkImage cachedNetworkImage(
          {double? width, double? height, BoxFit? fit}) =>
      CachedNetworkImage(
        imageUrl: this,
        width: width,
        height: height,
        placeholder: (context, url) => LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin,
          colors: [context.theme.primaryColor],
          strokeWidth: 1,
        ).paddingAll(8.r),
        fit: fit ?? BoxFit.cover,
      );

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  Text toText({TextStyle? style, TextAlign? align, bool translate = true}) =>
      Text(
        translate ? this.tr() : this,
        textAlign: align,
        style: style?.copyWith(fontFamily: 'Switzer'),
      );


  String encrypt() {
    var crypto = GetIt.I.get<CryptoSystemImpl>();
    return crypto.encrypt(this);
  }

  String decrypt() {
    var crypto = GetIt.I.get<CryptoSystemImpl>();
    return crypto.decrypt(this);
  }
}

extension DateFormatter on DateTime {
  String get postTimeAgo => format(this);
  String get postDateFormat => DateFormat.MMMd().format(this);
}

extension DurationExtension on int {
  Duration seconds() => Duration(seconds: this);
  Duration milliseconds() => Duration(milliseconds: this);
  Duration minutes() => Duration(minutes: this);
  Duration hours() => Duration(hours: this);
  Duration days() => Duration(days: this);
  Duration weeks() => Duration(days: this * 7);
  Duration months() => Duration(days: (this * 365 / 12).round());
  Duration years() => Duration(days: this * 365);
}

extension ContextExtension on BuildContext {
  showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  Future showDialog(String title, String message) {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: this,
        builder: (context) => CupertinoAlertDialog(
          title: title.toText(),
          content: message.toText(),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: 'OK'.toText(
                style: context.labelSmall!.copyWith(
                    // color: AppColors.cgsPrimaryButton,
                    ),
              ),
            ),
          ],
        ),
      );
    } else {
      return showGeneralDialog(
        context: this,
        barrierDismissible: true,
        barrierLabel: 'Dialog',
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation1, animation2) {
          return AlertDialog(
            title: title.toText(
                style: context.labelLarge!.copyWith(
                    // color: darkTheme.value ? Colors.white : Colors.black,
                    )),
            content: message.toText(style: context.labelSmall),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: 'OK'.toText(
                  style: context.labelSmall!.copyWith(
                      // color: AppColors.cgsPrimaryButton,
                      ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}

  // CachedNetworkImage cachedNetworkImage(
  //         {double? width,
  //         double? height,
  //         BoxFit? fit,
  //         Widget? placeholder,
  //         Widget? errorWidget}) =>
  //     CachedNetworkImage(
  //       imageUrl: this,
  //       errorWidget: (context, url, error) {
  //         return errorWidget ?? Container();
  //       },
  //       width: width,
  //       height: height,
  //       placeholder: (context, url) =>
  //           placeholder ?? const ShimmerTile().clipper(radius: 100.r),
  //       fit: fit ?? BoxFit.cover,
  //     );

extension WidgetExtension on Widget {
  Widget applySize({required double width, double? height}) =>
      SizedBox(width: width, height: height ?? width, child: this);

  Widget rotate({required int turns}) =>
      RotatedBox(quarterTurns: turns, child: this);

  Widget clipper({double? radius}) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius ?? 0), child: this);

  Widget flexWidget(int flex) => Flexible(flex: flex, child: this);

  Widget heroWrapper(String tag) => Hero(tag: tag, child: this);
}
