import 'package:elite_quiz/controller/baseController.dart';

class IconTextSwitchController extends BaseController {
  IconTextSwitchController({required this.on});
  late final bool on;
  void changevalue() {
    on = !on;
    update();
  }

}