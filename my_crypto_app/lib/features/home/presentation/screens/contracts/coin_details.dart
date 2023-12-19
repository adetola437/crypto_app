import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/models/coin_model.dart';
import '../../../bloc/connect/connect_bloc.dart';
import '../../widgets/data_points.dart';

abstract class CoinDetailsScreenViewContract {
  Widget build(BuildContext context);
}

abstract class CoinDetailsScreenControllerContract {
  late int periodSelected;
  late CoinModel coin;
  getChart(String? day, String? symbol);
  late ConnectBloc bloc;
  onPeriodSelected(int value);
  late List<List<FlSpot>> data;
  late int selectedIntervalIndex;
  String getDayOfWeek(int index);
  late List<DataPoint> dataPoints;
    late List<List<dynamic>> ohlcData;
}
