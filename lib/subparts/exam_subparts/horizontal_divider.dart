import 'package:flutter/material.dart';
import '../../utils/const.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1, // thickness of the divider
      color:Colors.blueGrey[900], // color of the divider
      indent: 0, // indentation from the left
      endIndent: 0, // indentation from the right
    );
  }
}

class ExamRules extends StatelessWidget {
  const ExamRules({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8,left: 0),            child: Container(
    height: 5,width: 5,decoration: BoxDecoration(shape: BoxShape.circle,gradient: commonLinearGradient),
          ),
        ),
        Expanded(
          child:Padding(
          padding: const EdgeInsets.only(left: 10), // adjust the top padding to align with the text
          child: Text(
              text,style: const TextStyle(fontSize: 15, color: Colors.blueGrey),
              // overflow: TextOverflow.ellipsis,
              // maxLines: 4,
            ),
          ),
        )
      ],
    );
  }
}