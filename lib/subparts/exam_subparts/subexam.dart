import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../localization/localization.dart';
import '../../utils/const.dart';
import '../../utils/extentions/font_extention.dart';
import 'exam_bottom_sheet.dart';

class SubExam extends StatefulWidget {
  const SubExam({super.key});

  @override
  State<SubExam> createState() => _SubExamState();
}

class _SubExamState extends State<SubExam> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const ExamBottomSheet(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LKeys.quizFusionQuest.tr,
                    style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                  ),
                  Text(
                    LKeys.timeDateDuration.tr,
                    style:MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),),

                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      LKeys.numMarks.tr,
                      style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}