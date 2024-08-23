import 'package:elite_quiz/controller/baseController.dart';

class LogInController extends BaseController {
  bool confirmPassword = false;
  SessionManager manager=SessionManager();
  void logIn(){
    confirmPassword = !confirmPassword;
    print("$confirmPassword");
    update();
  }
  Future<bool> isEmailCorr() async {
    String? email = manager.getEmailString();
    if (email == null || !email.contains('@gmail.com')) {
      showSnackBar("Please enter a valid email", type: SnackBarType.error);
      return false;
    }
    return true;
  }
  Future<bool> isPasswordCorr() async {
    String? password = manager.getPasswordString();
    if (password!.length < 8 ) {
      showSnackBar("password must contains minimum 8 characters", type: SnackBarType.error);
      return false;
    }
    return true;
  }

  void storeEmail(String text){
    return manager.setEmailString(text);
  }
  void storePassword(String text){
    return manager.setPasswordString(text);
  }
}