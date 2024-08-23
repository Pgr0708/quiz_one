import 'dart:async';

import 'package:elite_quiz/controller/baseController.dart';
import 'package:elite_quiz/localization/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetStartedController extends BaseController {
  Timer? timer;
  int activePage = 0;
  // int index = 0;
  bool reverse = false;
  final PageController pageViewController =
  PageController(initialPage: 0, viewportFraction: 1);
  @override
  void onReady() {
    super.onReady();
    timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (activePage < 2) {
        activePage++;
        // reverse = false;
      } else if (activePage == 2) {
        activePage = 0;
        // reverse = true;
      }
      // } else if (activePage < 2 && reverse == true) {
      //   activePage--;
      // } else if (activePage > 0 && reverse == false) {
      //   activePage++;
      // }
      pageViewController.animateToPage(
        activePage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
      update(); // Add this line to notify the GetBuilder to rebuild the UI
    });
  }
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  void increment(){
    activePage++;
    update();
  }
  void decrement(){
    activePage--;
    update();
  }
  void onPageChanged(int num){
    activePage = num;
    update(); // Add this line to notify the GetBuilder to rebuild the UI

  }
}