import 'package:flutter/material.dart';

import '../../utils/const.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard(
      {super.key,
      required this.label,
      this.score,
      required this.subtext,
      required this.scorepresent});
  final String label;
  final int? score;
  final String subtext;
  final bool scorepresent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
              color: scorepresent ? Colors.white.withOpacity(0.5) : Colors.grey,
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        scorepresent
            ? Text(
                '$score',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
              )
            : Text(
                subtext,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
              ),
      ],
    );
  }
}

class VerticalDividerLine extends StatelessWidget {
  const VerticalDividerLine({super.key, required this.white});
  final bool white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: VerticalDivider(
        width: 1, // width of the line
        color: white ? kWhite : Colors.grey, // color of the line
      ),
    );
  }
}
