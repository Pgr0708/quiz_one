import 'package:elite_quiz/controller/baseController.dart';

class ExamBottomSheetController extends BaseController {
  bool showless = true;
  bool rulesAccepted = false;
  void show() {
    showless = !showless;
    update();
  }
  void rulesaccept() {
    rulesAccepted = !rulesAccepted;
    update();
  }
}