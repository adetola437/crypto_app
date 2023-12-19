import 'package:flutter/material.dart';

abstract class PortfolioScreenViewContract {
  Widget build(BuildContext context);
}

abstract class PortfolioScreenControllerContract {
  setFavorites(List<dynamic> favorites);
  late List<dynamic> favorites;
  late List<List<dynamic>> ohlcData;
}
