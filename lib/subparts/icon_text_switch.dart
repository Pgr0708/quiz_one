import 'package:elite_quiz/controller/icon_text_switch_controller.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../screens/avtar_selection_screen.dart';
import '../utils/const.dart';

class IconTextSwitch extends StatelessWidget {
     IconTextSwitch(
      {super.key,
      required this.on,
      required this.text,
      this.icondata,
      required this.iconpresent,
      required this.switchpresent,
      required this.ontap, required this.isInviteCode});
  late final bool on;
  final String text;
  final IconData? icondata;
  final bool iconpresent;
  final bool switchpresent;
  final Function ontap;
  final bool isInviteCode;

  @override
  Widget build(BuildContext context) {
    IconTextSwitchController controller = IconTextSwitchController(on: on);
    return GetBuilder(
        init:controller,
        builder: (controller) {
        return GestureDetector(
          onTap: (){
              ontap();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            height: 55,
            decoration: BoxDecoration(
              borderRadius:isInviteCode? BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)):BorderRadius.circular(10),
              color: kTitleColor,
            ),
            child: Row(
              children: [
                iconpresent
                    ? Container(
                        padding: const EdgeInsets.only(left: 8),
                        child:icondata != null? Icon(
                          icondata,
                          color: kPink,
                          size: 25,
                        ): null,
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                      onTap: () {},
                      child: Text(text,
                          style: MyTextStyle.poppinsRegular(
                              color: kSubSubTextColor, size: 17))),
                ),
                const Spacer(),
                switchpresent
                    ? Switch1(
                        func: () {
                          ontap();
                        },
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      }
    );
  }
}
