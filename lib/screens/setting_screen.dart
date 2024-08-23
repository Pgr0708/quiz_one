import 'package:elite_quiz/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../subparts/icon_text_switch.dart';
import '../subparts/setting_screen_subparts.dart';
import '../utils/const.dart';
import 'language_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
 final bool on1 = true;
 final bool on2 = true;
 final bool on3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(text: LKeys.settings.tr,isBackButton: true,isActions: false,isBottom: false, ),
      body: Container(
        color: kBlueGreyBack,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: IconTextSwitch(
                  on: on1,
                  text: LKeys.sound.tr,
                  iconpresent: true,
                  icondata: Icons.volume_down,
                  switchpresent: true,
                  ontap: () {}, isInviteCode: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: IconTextSwitch(
                  on: on2,
                  text: LKeys.vibration.tr,
                  iconpresent: true,
                  icondata: Icons.vibration,
                  switchpresent: true,
                  ontap: () {}, isInviteCode: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: IconTextSwitch(
                  on: on3,
                  text: LKeys.playFontSize.tr,
                  iconpresent: true,
                  icondata: Icons.abc_sharp,
                  switchpresent: false,
                  ontap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return  PlayAreaFontSizeBottomSheet();
                      },
                    );
                  }, isInviteCode: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: IconTextSwitch(
                  on: on3,
                  text: LKeys.language.tr,
                  iconpresent: true,
                  icondata: Icons.language_rounded,
                  switchpresent: false,
                  ontap: () {
                   Get.to(() => LanguageScreen(backButton: true));
                      }, isInviteCode: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
