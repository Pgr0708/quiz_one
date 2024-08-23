import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.data, required this.onTap});
  final String data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(data,style: TextStyle(color: Colors.white),),
          ),
      ),
    );
  }
}
