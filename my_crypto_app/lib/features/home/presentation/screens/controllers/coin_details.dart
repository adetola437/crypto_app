import 'package:fl_chart/fl_chart.dart';
import 'package:my_crypto_app/features/home/bloc/connect/connect_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/data/models/coin_model.dart';
import '../../../../../core/helpers/widget_helper.dart';
import '../../../bloc/chart/chart_bloc.dart';
import '../../widgets/data_points.dart';
import '../contracts/coin_details.dart';
import '../views/coin_details.dart';

class CoinDetailsScreen extends StatefulWidget {
  static const String route = '/coin_details';
  final CoinModel coin;
  const CoinDetailsScreen({Key? key, required this.coin}) : super(key: key);

  @override
  CoinDetailsScreenController createState() => CoinDetailsScreenController();
}

class CoinDetailsScreenController extends State<CoinDetailsScreen>
    implements CoinDetailsScreenControllerContract {
  late CoinDetailsScreenViewContract view;

  @override
  void initState() {
    view = CoinDetailsScreenView(this, GetIt.I.get<IWidgetHelper>());
    bloc = ConnectBloc(url: widget.coin.symbol);
    coin = widget.coin;
    getFirstChart();
    super.initState();
  }

  @override
  void dispose() {
    bloc.add(Disconnect());
    super.dispose();
  }

  @override
  getChart(String? day, String? symbol) {
    context.read<ChartBloc>().add(GetOhlcEvent(
        coin: symbol ?? widget.coin.name.toLowerCase(), day: day ?? '1'));
  }

  getFirstChart() {
    context
        .read<ChartBloc>()
        .add(GetOhlcEvent(coin: widget.coin.name.toLowerCase(), day: '1'));
  }

  @override
  List<DataPoint> dataPoints = [
    const DataPoint(month: 'Jan', value: 30),
    const DataPoint(month: 'Feb', value: 50),
    const DataPoint(month: 'Mar', value: 40),
    const DataPoint(month: 'Apr', value: 70),
    const DataPoint(month: 'May', value: 60),
    const DataPoint(month: 'Jun', value: 80),
  ];
  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  int periodSelected = 0;

  @override
  onPeriodSelected(int value) {
    setState(() {
      periodSelected = value;
    });
  }

  @override
  List<List<FlSpot>> data = [];

  @override
  int selectedIntervalIndex = 0;

  List<List<FlSpot>> generateDummyData() {
    const int dataPoints = 7;
    const int numIntervals = 4;

    List<List<FlSpot>> result = [];

    for (int i = 0; i < numIntervals; i++) {
      List<FlSpot> intervalData = [];

      for (int j = 0; j < dataPoints; j++) {
        intervalData
            .add(FlSpot(j.toDouble(), i.toDouble() * 20 + j.toDouble()));
      }

      result.add(intervalData);
    }

    return result;
  }

  @override
  String getDayOfWeek(int index) {
    // Replace this with your logic to determine the day of the week based on the index
    // This is just a dummy implementation
    List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return daysOfWeek[index % 7];
  }

  @override
  late CoinModel coin;

  @override
  late ConnectBloc bloc;
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
