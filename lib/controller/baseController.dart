import 'package:elite_quiz/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


 class BaseController extends GetxController {
  static var shared = BaseController();
  bool isLoading = false;

  void startLoading() {
    Future.delayed(const Duration(milliseconds: 1), () {
      loader();
    });
    isLoading = true;
    update();
  }

  void stopLoading([List<Object>? ids, bool condition = true]) {
    if (isLoading) {
      Get.back();
      isLoading = false;
      update();
    }
  }

  loader({double? value}) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      // barrierDismissible: false,
      builder: (context) {
        return Center(
          child: CupertinoActivityIndicator(
            color: kWhite,
            radius: 20,
          ),
        );
      },
    );
  }

  void showSnackBar(String title,
      {SnackBarType type = SnackBarType.info, String? message}) {
    if (Get.isSnackbarOpen) {
      return;
    }
    Color color = type == SnackBarType.success
        ? Colors.black
        : (type == SnackBarType.error ? Colors.red : Colors.black);
    IconData icon = type == SnackBarType.success
        ? Icons.check_circle_rounded
        : (type == SnackBarType.error
            ? Icons.cancel_rounded
            : Icons.info_rounded);
    Get.rawSnackbar(
      messageText: Center(
        child: Text(
          title,
          style: TextStyle(color: color),
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 50,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      icon: Icon(
        icon,
        color: color,
        size: 24,
      ),
      maxWidth: 300,
      // backgroundColor: kGrey.shade300,
      animationDuration: const Duration(milliseconds: 1000),
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    );
  }
}

enum SnackBarType { info, error, success }

class SessionManager {
  var storage = GetStorage();
  static var shared = SessionManager();
  // void setSetting(Setting? setting) {
  //   storage.write('Setting', setting?.toJson());
  // }
  //
  // Setting? getSetting() {
  //   final storeSettingData = storage.read('Setting');
  //   if (storeSettingData != null && storeSettingData.isNotEmpty) {
  //     return Setting.fromJson(storeSettingData);
  //   }
  //   return null;
  // }
  void setIsLanguageSet(bool isSetLang){
    storage.write("bool", isSetLang);
  }
  bool? getIsLanguageSet() {
    return storage.read("bool");
  }
  void setEmailString(String email){
    storage.write("email", email);
  }
  String? getEmailString() {
    return storage.read("email");
  }
  void setPasswordString(String email){
    storage.write("password", email);
  }
  String? getPasswordString() {
    return storage.read("password");
  }
}
class Device {
  static var height = Get.height;
  static var width = Get.width;
}


