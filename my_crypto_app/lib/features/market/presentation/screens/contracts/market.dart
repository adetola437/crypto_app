import 'package:flutter/material.dart';

abstract class MarketScreenViewContract {
  Widget build(BuildContext context);
}

abstract class MarketScreenControllerContract {
  Future<void> refreshData();
}
