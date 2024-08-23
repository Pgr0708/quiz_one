import 'package:elite_quiz/controller/baseController.dart';

class PlaceholderController extends BaseController {
  bool eyeOpen = false;
void eyeCloseOpen(){
  eyeOpen = !eyeOpen;
  update();
}
}