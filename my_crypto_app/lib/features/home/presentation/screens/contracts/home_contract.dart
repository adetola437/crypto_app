import 'package:flutter/material.dart';

abstract class HomeViewContract {
  Widget build(BuildContext context);
}

abstract class HomeControllerContract {
  late int currentIndex;
  void onItemTapped(int index);
  

}
