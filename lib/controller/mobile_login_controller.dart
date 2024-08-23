import 'package:elite_quiz/controller/baseController.dart';

class MobileLoginController extends BaseController {
  bool isOtpRequested = false;
  void requestOtp(){
    isOtpRequested = true;
    update();
  }
}