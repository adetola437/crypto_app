import 'dart:convert';

import 'package:web_socket_channel/io.dart';

import '../../../../../core/core.dart';
import '../../../../../core/helpers/widget_helper.dart';
import '../contracts/portfolio.dart';
import '../views/portfolio.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

class PortfolioScreen extends StatefulWidget {
  static const String route = '/Portfolio';
  final dynamic param;
  const PortfolioScreen({Key? key, this.param}) : super(key: key);

  @override
  PortfolioScreenController createState() => PortfolioScreenController();
}

class PortfolioScreenController extends State<PortfolioScreen>
    implements PortfolioScreenControllerContract {
  late PortfolioScreenViewContract view;

  @override
  void initState() {
    view = PortfolioScreenView(this, GetIt.I.get<IWidgetHelper>());
   //  streamListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  List<dynamic> favorites = [];
  @override
  setFavorites(List<dynamic> newFavorites) {
    setState(() {
      favorites = newFavorites;
    });
  }

  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@trade');
  streamListener() {
    channel.stream.listen((event) {
      Map<String, dynamic> getData = jsonDecode(event);
      print(getData['p']);
    });
  }
  @override
    List<List<dynamic>> ohlcData = [
    [1702022400000, 43159.0, 43258.0, 43159.0, 43225.0],
    [1702024200000, 43208.0, 43248.0, 43169.0, 43248.0],
    [1702026000000, 43258.0, 43258.0, 43197.0, 43248.0],
    [1702027800000, 43226.0, 43292.0, 43209.0, 43292.0],
    [1702029600000, 43292.0, 43292.0, 43174.0, 43174.0],
    [1702031400000, 43161.0, 43204.0, 43134.0, 43142.0],
    [1702033200000, 43216.0, 43346.0, 43216.0, 43330.0],
    [1702035000000, 43417.0, 43454.0, 43406.0, 43444.0],
  ];
}
