import 'package:elite_quiz/controller/baseController.dart';
import 'package:get/get.dart';
import '../screens/result_screen.dart';

class StartQuizController extends BaseController {
  StartQuizController({required this.s});
  final int s;
  int a = 1;
  void changeBody() {
    a == s? Get.to(() => const ResultScreen()):null;
    a++;
    update();
  }
}