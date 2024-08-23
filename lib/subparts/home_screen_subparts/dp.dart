import 'package:flutter/material.dart';

class Dp extends StatelessWidget {
  const Dp({super.key, required this.height, required this.width, required this.color, required this.borderwidth,required this.widget,required this.margin, required this.backgroundcolor, required this.isCamera});
  final double height;
  final double width;
  final Color color;
  final double borderwidth;
  final Widget widget;
  final double margin;
  final Color backgroundcolor;
  final bool isCamera;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: height,
      width: width,
      margin: EdgeInsets.only(top:margin,left:isCamera? margin:margin/2),
      decoration: BoxDecoration(
        color: backgroundcolor,
        border: Border.all(color: color, width: borderwidth),
        shape: BoxShape.circle,
      ),
      child: Container(
        child: widget,
      ),

    );
  }
}
