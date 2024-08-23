import 'package:elite_quiz/controller/users_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
   void toastMessage(String message){
     Fluttertoast.showToast(msg: message,toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIosWeb: 1,backgroundColor: Colors.white,textColor: Colors.red,fontSize: 16);
   }
}