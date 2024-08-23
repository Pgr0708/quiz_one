import 'package:elite_quiz/controller/baseController.dart';
import 'package:elite_quiz/localization/localization.dart';
import 'package:get/get.dart';

class DemoController extends BaseController {
  int num = 0;
  void increment() {
    print(LKeys.letStart.tr);
    print(LKeys.letStart);
    num++;
    update();
  }

  void decrement() {
    num--;
    update();
  }

}