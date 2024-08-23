import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../subparts/exam_subparts/subexam.dart';
import '../utils/const.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(
        text: LKeys.exam.tr,
        isBackButton: true,
        isBottom: true,
        isActions: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: kBlueGreyBack,
        child: const Column(
          children: [
            SubExam(),
            SubExam(),
          ],
        ),
      ),
    );
  }
}
