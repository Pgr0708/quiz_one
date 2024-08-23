import 'package:elite_quiz/screens/home_screen.dart';
import 'package:elite_quiz/screens/login_screen.dart';
import 'package:elite_quiz/controller/mobile_login_controller.dart';
import 'package:elite_quiz/screens/start_quiz_screen.dart';
import 'package:elite_quiz/utils/const.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_fields/otp_fields.dart';
import '../controller/baseController.dart';
import '../localization/localization.dart';
import '../subparts/login_screen_subparts/placeholder_gesturedoctor.dart';
import 'package:country_code_picker/country_code_picker.dart';

class MobileLogin extends StatelessWidget {
  const MobileLogin({super.key});
  @override
  Widget build(BuildContext context) {
    MobileLoginController controller = MobileLoginController();
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return Scaffold(
            // appBar: AppBar(elevation: 0,backgroundColor:BlueGreyBack),
            appBar: Appbar1(
                text: LKeys.registration.tr,
                isBackButton: true,
                isBottom: false,
                isActions: true),

            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kBaseColorTwo,
              ),
              height: double.infinity,
              child: SingleChildScrollView(
                primary: true,
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: Device.height / 10,
                      ),
                      Container(
                        height:Device.height / 5,
                        width: Device.width / 2,
                        color: kWhite,
                        child: const Image(
                          image: AssetImage(
                            MyImages.personThree,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: Device.height / 18,
                      ),
                      // Text(,style: MyTextStyle.poppinsSemiBold(size: 20,color: kTitleColor)),
                      const SizedBox(height: 10),
                      Container(
                          width: Device.width / 1.3,
                          alignment: Alignment.center,
                          child: Text(
                            LKeys.enterPhoneVerify.tr,
                            style: MyTextStyle.poppinsRegular(
                                size: 17, color: kSubTextColor),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: Device.height / 18,
                      ),
                      Column(
                        children: [
                          controller.isOtpRequested
                              ? OtpFieldsCustom(
                                  context: context,
                                  numberOfFields: 6,
                                  onCodeChanged: (string) {},
                                  backgroundColor:
                                      Colors.blueGrey.withOpacity(0.2),
                                  filledBorderColor: Colors.transparent,
                                  focusedBorderColor: Colors.transparent,
                                  emptyBorderColor: Colors.transparent,
                                  style: MyTextStyle.poppinsRegular(
                                      size: 20, color: kSubTextColor),
                                  // autofillOtp: LKeys.defaultOtp.tr,
                                )
                              : PlaceHolder(
                                  words: LKeys.defauitPhoneNumber.tr,
                                  isInviteCode: false,
                                  isPrefix: true,
                                  prefixIcon: CountryCodePicker(
                                    onChanged: print,
                                    initialSelection: 'IN',
                                    favorite: ['+91', 'IN'],
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                    barrierColor: Colors.white.withOpacity(0.2),
                                    textStyle: MyTextStyle.poppinsSemiBold(
                                        color: kSubSubTextColor, size: 15),
                                    dialogBackgroundColor: kBaseColorTwo,
                                    dialogTextStyle: MyTextStyle.poppinsRegular(
                                        size: 12, color: Colors.white),
                                  ), isSuffix: false, onChanged: (String data) {  },
                                ),
                          const SizedBox(height: 20),
                          OnlyTextContainer(
                              text: controller.isOtpRequested
                                  ? LKeys.enterOtp.tr
                                  : LKeys.requestOtp.tr,
                              colorchange: false,
                              func: () {
                                controller.isOtpRequested
                                    ? Get.to(() => HomeScreen())
                                    : controller.requestOtp();
                                ;
                              }),
                          SizedBox(
                            height: Device.height / 25,
                          ),
                          const TermsAndPrivacy()
                        ],
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
