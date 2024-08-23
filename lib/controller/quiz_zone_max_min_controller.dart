import 'package:elite_quiz/controller/baseController.dart';

class QuizZonMaxMinController extends BaseController {
  bool ispressed = false;
  void press(){
    ispressed = !ispressed;
    update();
  }
}