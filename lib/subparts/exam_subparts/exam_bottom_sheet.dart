import 'package:elite_quiz/controller/exam_bottomsheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_fields/otp_fields.dart';
import '../../controller/baseController.dart';
import '../../localization/localization.dart';
import '../../screens/group_battel_screen_one.dart';
import '../../utils/const.dart';
import '../../utils/extentions/font_extention.dart';
import 'horizontal_divider.dart';

class ExamBottomSheet extends StatelessWidget {
  const ExamBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    ExamBottomSheetController controller = ExamBottomSheetController();
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: controller.showless ? Device.height/1.7 : Device.height/1.3,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: kBlueGreyBack,
          ),
          child: Column(
            children: [
              Text(
                LKeys.enterInExam.tr,
                style: MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
              ),
              const HorizontalDivider(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  LKeys.enterExamKey.tr,
                  style: MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: OtpFieldsCustom(
                  context: context,
                  numberOfFields: 4,
                  onCodeChanged: (string) {},
                  backgroundColor: Colors.blueGrey.withOpacity(0.2),
                  filledBorderColor: Colors.transparent,
                  focusedBorderColor: Colors.transparent,
                  emptyBorderColor: Colors.transparent,
                  style: MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
                  autofillOtp: LKeys.defaultOtp.tr,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey.withOpacity(0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LKeys.examRules.tr,
                        style: MyTextStyle.poppinsRegular(
                            size: 20, color: kSubTextColor),
                      ),
                      ExamRules(text: LKeys.examRuleOne.tr),
                      ExamRules(text: LKeys.examRuleTwo.tr),
                      // Container(
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         // padding: EdgeInsets.only(bottom: 40),
                      //         child: const Text('·',
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w900,
                      //                 color: Colors.black,
                      //                 fontSize: 35),
                      //           textBaseline: TextBaseline.alphabetic,
                      //           // textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //           width:
                      //               10), // add a space between the dot and the text
                      //       Expanded(
                      //         child: Text(
                      //           "If you minimize application or open other application and don't come back to application with in 5 seconds then exam will complete automatically",
                      //           style:
                      //               TextStyle(fontSize: 15, color: Colors.blueGrey),
                      //           overflow: TextOverflow.ellipsis,
                      //           maxLines: 4,
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      !controller.showless
                          ? ExamRules(
                              text: LKeys.examRuleThree.tr,
                            )
                          : Container(),
                      !controller.showless
                          ? ExamRules(text: LKeys.examRuleFour.tr)
                          : Container(),
                      !controller.showless
                          ? ExamRules(text: LKeys.examRuleFive.tr)
                          : Container(),
                      !controller.showless
                          ? ExamRules(
                              text: LKeys.examRuleSix.tr,
                            )
                          : Container(),
                      GestureDetector(
                        onTap: () {
                          controller.show();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: DecoratedBox(
                              decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1.0)),
                              ),
                              child: Text(
                                controller.showless ? LKeys.showMore.tr : LKeys.showLess.tr,
                                style: MyTextStyle.poppinsRegular(
                                    size: 20, color: kSubTextColor),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                        controller.rulesaccept();
                        },
                        child: Icon(
                          Icons.verified_rounded,
                          color: controller.rulesAccepted ? kPink : Colors.grey,
                          size: 30,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      LKeys.iAgreeExamRules.tr,
                      style: MyTextStyle.poppinsRegular(
                          size: 20, color: kSubTextColor),
                    ),
                  ],
                ),
              ),
              OnlyTextContainer(
                text: LKeys.submit.tr,
                colorchange: !controller.rulesAccepted,
                func: () {},
              )
            ],
          ),
        );
      }
    );
  }
}
