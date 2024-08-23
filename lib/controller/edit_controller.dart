

import 'package:elite_quiz/controller/baseController.dart';

class EditController extends BaseController{
  bool on = false;
  void toggleSwitch() {
      on = !on;
      update();
  }

}

class SwitchController extends BaseController{
  bool isSwitched = false;
  void onPressed (bool value) {
  isSwitched = value;
  update();
  }
}