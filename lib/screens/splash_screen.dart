import 'package:elite_quiz/controller/splash_controller.dart';
import 'package:elite_quiz/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SplashController controller = SplashController();
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          backgroundColor: kBaseColorOne,
          body: Container(),
        );
      }
    );
  }
}




class AnimatedScreen extends StatelessWidget {
  AnimatedController controller = AnimatedController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          backgroundColor: kBaseColorOne,
          body: Center(
            child: ScaleTransition(
              scale: controller.animationController,
              child: Lottie.asset('lottie/animation.json'),
            ),
          ),
        );
      }
    );
  }
}

