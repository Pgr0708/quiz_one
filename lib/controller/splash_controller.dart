import 'package:elite_quiz/controller/baseController.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/language_screen.dart';
import '../screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class SplashController extends BaseController {
  @override
  void onReady() {
    super.onReady();
    print('SplashController onReady called');
    Future.delayed(Duration(seconds: 2), () {
      print('Navigating to AnimatedScreen');
      Get.to(() => AnimatedScreen());
    });
  }

  @override
  void dispose() {
    Get.delete<SplashController>();
    super.dispose();
  }
}

class AnimatedController extends BaseController
    with GetSingleTickerProviderStateMixin {
  SessionManager manager = SessionManager();
  // AnimatedController({required this.animationController});
  late final AnimationController animationController;

    AnimatedController() {
      animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500),
      );
    }

  @override
  void onReady() {
    animationController.forward().then((_) {
      Future.delayed(const Duration(seconds: 3), () {
        manager.getIsLanguageSet() == true
            ? Get.to(() => HomeScreen())
            : Get.to(() => const LanguageScreen(
                  backButton: false,
                ));
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
