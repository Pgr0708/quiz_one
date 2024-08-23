import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle poppinsMedium({double? size, Color? color}) {
    return TextStyle(
        fontFamily: 'outfit-medium', fontSize: size ?? 16, color: color);
  }

  static TextStyle poppinsRegular({double? size, Color? color}) {
    return TextStyle(
        fontFamily: 'outfit-regular', fontSize: size ?? 16, color: color);
  }

  static TextStyle poppinsLight({double? size, Color? color}) {
    return TextStyle(
        fontFamily: 'outfit-light', fontSize: size ?? 16, color: color);
  }

  static TextStyle poppinsSemiBold({double? size, Color? color}) {
    return TextStyle(
        fontFamily: 'outfit-semibold', fontSize: size ?? 16, color: color);
  }

  static TextStyle? poppinsSemiBold2({double? size, Color? color}) {
    return TextStyle(
        fontFamily: 'outfit-semibold', fontSize: size ?? 16, color: color);
  }

  static TextStyle poppinsBold({double? size, Color? color}) {
    return TextStyle(
        fontFamily: 'outfit-bold', fontSize: size ?? 16, color: color);
  }

  static TextStyle poppinsBlack({double? size, Color? color}) {
    return TextStyle(
        fontFamily: 'outfit-black', fontSize: size ?? 16, color: color);
  }

  static TextStyle poppinsThin({double? size, Color? color}) {
    return TextStyle(
        fontFamily: 'outfit-thin', fontSize: size ?? 16, color: color);
  }
}
