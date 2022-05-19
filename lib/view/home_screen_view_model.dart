import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_jtj/provider/base_model.dart';

class HomeScreenViewModel extends BaseModel {

  int selectedIndex = 0;
  int randomNumber = 1;

  // on / off 초기값 = 꺼짐
  bool isLightOn = false;
  bool isTempOn = false;

  final PageController pageController = PageController();

  void generateRandomNumber() {
    randomNumber = Random().nextInt(8);
    notifyListeners();
  }

  void lightSwitch() {
    isLightOn = !isLightOn;
    notifyListeners();
  }

  void tempSwitch() {
    isTempOn = !isTempOn;
    notifyListeners();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,);
  }
}