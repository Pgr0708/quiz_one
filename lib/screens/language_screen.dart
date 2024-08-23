import 'package:elite_quiz/controller/language_controller.dart';
import 'package:elite_quiz/screens/start_quiz_screen.dart';
import 'package:elite_quiz/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../subparts/language_screen_subparts.dart';
import 'get_started_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key, required this.backButton});
  final bool backButton;
  @override
  Widget build(BuildContext context) {
    LanguageController controller = LanguageController();
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return Scaffold(
            // backgroundColor: kbasecolor.withOpacity(0.8),
            appBar: Appbar1(
              text: LKeys.language.tr,
              isBackButton: backButton == true? true : false,
              isBottom: false,
              isActions: false,
            ),
            body: Container(
              color: kBaseColorTwo,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  backbutton == false? Container(
                          child: Text(
                          "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.red),
                        ))
                      : Container(),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const MyToggleButtons(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 28.0),
                          child: OnlyTextContainer(
                            text: backButton == true
                                ? LKeys.continueOnly.tr
                                : LKeys.set.tr,
                            colorchange: false,
                            func: () {
                              controller.changeId();
                              Get.to(() => GetStartedScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
// Container(
// height: double.infinity,width: double.infinity,
// child: ListView(
// scrollDirection: Axis.vertical,
// children: [
// MyToggleButtons(),
// OnlyTextContainer(
// text: LKeys.set.tr, colorchange: false, func: () {Get.to(() => const GetStartedScreen());})
// ],

// ),
// ),
