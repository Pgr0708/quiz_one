import 'package:elite_quiz/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../localization/localization.dart';
import '../utils/const.dart';
import '../utils/extentions/font_extention.dart';

enum Period { arabic, english, hindi, spanish ,gujarati , chinese ,portuguese , french , russian , mongolian , kurdis }

class MyToggleButtons extends StatelessWidget {
  const MyToggleButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
            scrollDirection: Axis.vertical,
            children: [
              _buildRadioButton(
                  "العربية", LKeys.arabic.tr, Period.arabic),
              _buildRadioButton(
                  "English", LKeys.english.tr, Period.english),
              _buildRadioButton(
                  "हिंदी", LKeys.hindi.tr, Period.hindi),
              _buildRadioButton(
                  "Española", LKeys.spanish.tr, Period.spanish),
              _buildRadioButton(
                  "ગુજરાતી", LKeys.gujarati.tr, Period.gujarati),
              _buildRadioButton(
                  "中国人", LKeys.chinese.tr, Period.chinese),
              _buildRadioButton(
                  "português", LKeys.portuguese.tr, Period.portuguese),
              _buildRadioButton(
                  "française", LKeys.french.tr, Period.french),
              _buildRadioButton(
                  "русский", LKeys.russian.tr, Period.russian),
              _buildRadioButton(
                  "монгол", LKeys.mongolian.tr, Period.mongolian),
              _buildRadioButton(
                  "Kurdî", LKeys.kurdis.tr, Period.kurdis),
              SizedBox(height: 100,)
            ],
          );
  }

  Widget _buildRadioButton(String text1, String text2, Period period) {
    SelectLangListController controller = SelectLangListController();
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: controller.selectedPeriod == period
                      ? GradientBoxBorder(
                      gradient: commonLinearGradient, width: 2)
                      : Border.all(
                      color: Colors.grey.withOpacity(0.2), width: 2)),
              child: GestureDetector(
                onTap: () {
                  controller.selectLang(period);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color : Colors.transparent,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0,left: 20),
                        child: Text(text1,
                            style: MyTextStyle.poppinsRegular(
                                size: 15,
                                color: controller.selectedPeriod == period
                                    ? kTitleColor
                                    : kTitleTextColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0,left: 20),
                        child: Text(
                          text2,
                          style:
                          MyTextStyle.poppinsThin(
                              size: 12, color: kSubTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
