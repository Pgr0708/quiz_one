import 'package:elite_quiz/controller/play_area_font_size_bottomsheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../utils/const.dart';
import '../utils/extentions/font_extention.dart';
import 'exam_subparts/horizontal_divider.dart';

class PlayAreaFontSizeBottomSheet extends StatelessWidget {
   PlayAreaFontSizeBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    PlayAreaFontSizeBottomSheetController controller = PlayAreaFontSizeBottomSheetController();
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Container(
          height: MediaQuery.of(context).size.height/2,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  LKeys.playFontSize.tr,
                  style: MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
                ),
              ),
              const SizedBox(height: 5),
              const HorizontalDivider(),
              const SizedBox(height: 5),
              Text(
                LKeys.fontSheetSubText.tr,
                style: MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
              ),
              const SizedBox(height: 20),
              Slider(
                activeColor: kPink,
                value: controller.fontSize,
                min: 10.0,
                max: 30.0,
                onChanged: (value) {
                  controller.font(value);
                },
              ),
              // const SizedBox(height: 250),
            ],
          ),
        );
      }
    );
  }
}
