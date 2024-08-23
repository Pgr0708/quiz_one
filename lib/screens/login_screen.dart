import 'package:elite_quiz/controller/log_in_controller.dart';
import 'package:elite_quiz/screens/avtar_selection_screen.dart';
import 'package:elite_quiz/screens/home_screen.dart';
import 'package:elite_quiz/screens/start_quiz_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/baseController.dart';
import '../localization/localization.dart';
import '../utils/extentions/image_extention.dart';
import '../subparts/login_screen_subparts/placeholder_gesturedoctor.dart';
import '../utils/const.dart';
import '../utils/extentions/font_extention.dart';
import 'mobile_login_screen.dart';

class Bottomsheet1 extends StatelessWidget {
  const Bottomsheet1({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    LogInController controller = LogInController();
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return Scaffold(
            // resizeToAvoidBottomInset: true,
            appBar: Appbar1(
                text: '', isBackButton: true, isBottom: false, isActions: true),
            body: Container(
              padding: const EdgeInsets.all(10),
              color: kBaseColorTwo,
              child: SingleChildScrollView(
                primary: true,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      !controller.confirmPassword
                          ? LKeys.logInToContinue.tr
                          : LKeys.signUpToContinue.tr,
                      style: MyTextStyle.poppinsSemiBold(
                          color: kTitleTextColor, size: 18),
                    )),
                    SizedBox(
                      height: Device.height / 30,
                    ),
                    Container(
                      color: Colors.white,
                      child: Image(
                        height: Device.width / 5,
                        width:Device.width / 2,
                        image: AssetImage(
                          MyImages.personThree.tr,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: Device.height / 15,
                    ),
                    Column(
                      children: [
                        PlaceHolder(
                          words: LKeys.email.tr,
                          isInviteCode: false,
                          isPrefix: true,
                          prefixIcon: prefixSuffixIcon(MyImages.email,(){}), isSuffix: false, onChanged: (String data) {controller.storeEmail(data);},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        PlaceHolder(
                          words: LKeys.password.tr,
                          isInviteCode: false,
                          isPrefix: true,
                          prefixIcon: prefixSuffixIcon(MyImages.password,(){}), isSuffix: true, onChanged: (String data) { controller.storePassword(data);},
                        ),
                        controller.confirmPassword
                            ? Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: PlaceHolder(
                                    words: LKeys.confirmPassword.tr,
                                    isInviteCode: false,
                                    isPrefix: true,
                                    prefixIcon: prefixSuffixIcon(
                                      MyImages.password,(){}
                                    ), isSuffix: false, onChanged: (String data) {  },),
                              )
                            : const SizedBox(
                                height: 1,
                              ),
                        !controller.confirmPassword?
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: TextButton(
                                onPressed: () {},
                                child: Text(LKeys.forgotPassword.tr,
                                    style: MyTextStyle.poppinsRegular(
                                        color: kSubSubTextColor, size: 14)))):SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: OnlyTextContainer(
                              text: !controller.confirmPassword
                                  ? LKeys.logIN.tr
                                  : LKeys.signUp.tr,
                              colorchange: false,
                              func: () async {
                                if (await controller.isEmailCorr() && await controller.isPasswordCorr()) {
                                  controller.confirmPassword
                                      ? Get.to(() => const EditScreen())
                                      : Get.to(() => HomeScreen());
                                }
                              }),
                        ),
                        controller.confirmPassword
                            ? Row(
                                children: [
                                  Text(
                                    LKeys.alreadyHaveAcc.tr,
                                    style: MyTextStyle.poppinsRegular(
                                        size: 12, color: kSubSubTextColor),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.logIn();
                                    },
                                    child: Text(
                                      LKeys.logIN.tr,
                                      style: MyTextStyle.poppinsRegular(
                                          size: 14, color: kContColor),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    LKeys.dontHaveAcc.tr,
                                    style: MyTextStyle.poppinsRegular(
                                        size: 12, color: kSubSubTextColor),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        controller.logIn();
                                      },
                                      child: Text(
                                        LKeys.signUp.tr,
                                        style: MyTextStyle.poppinsRegular(
                                            size: 14, color: kContColor),
                                      )),
                                ],
                              ),
                        // Gesturedoctor(firsttext: 'Sign up ?',secondtext:  "Sign in ?", signuppressed:  signuppressed1,changevalue: changvalue),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                   !controller.confirmPassword?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        icon(MyImages.google.tr, () {
                          Get.to(() => HomeScreen());
                        },
                            const EdgeInsets.only(
                                right: 2, top: 2, bottom: 2, left: 2),
                            LKeys.logInWithGoogle.tr),
                        // icon(MyImages.instagram.tr, () {}, const EdgeInsets.all(10),),
                        icon(MyImages.mobile.tr, () {
                          Get.to(() => MobileLogin());
                        },
                            const EdgeInsets.only(
                                right: 15, top: 6, bottom: 6, left: 4),
                            LKeys.logInWithPhoneNumber.tr),
                        // icon(MyImages.twitter.tr, () {}, const EdgeInsets.all(8))
                      ],
                    ):Container(),
                    SizedBox(height: 20,),
                    const TermsAndPrivacy(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Device.width / 1.3,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: <InlineSpan>[
          TextSpan(
              text: LKeys.bySigningYouAgree.tr,
              style: MyTextStyle.poppinsRegular(
                  color: kSubSubTextColor, size: 15)),
          WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  LKeys.termsOfService.tr,
                  textDirection: TextDirection.ltr,
                  style:
                      MyTextStyle.poppinsSemiBold(size: 15, color: kContColor),
                ),
              )),
          TextSpan(
              text: LKeys.and.tr,
              style: MyTextStyle.poppinsRegular(
                  color: kSubSubTextColor, size: 15)),
          // TextSpan(text:  ' Privacy Policy',style: TextStyle(color: Colors.white,)),
          WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    LKeys.privacyPolicy.tr,
                    textDirection: TextDirection.ltr,
                    style: MyTextStyle.poppinsSemiBold(
                        size: 15, color: kContColor),
                  ))),
        ]),
      ),
    );
  }
}

Widget icon(String url, Function fnc, EdgeInsetsGeometry padding, String text) {
  return GestureDetector(
    onTap: () {
      fnc();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 60,
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
            gradient: commonLinearGradient,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: padding,
              child: Image.asset(
                url,
                color: kTitleTextColor,
              ),
            ),
            Text(
              text,
              style: MyTextStyle.poppinsSemiBold(
                  color: kSubSubTextColor, size: 15),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget prefixSuffixIcon(
  String url,Function onTap
) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: GestureDetector(
      onTap: (){onTap();},
      child: Image.asset(
        url,
        color: kSubSubTextColor,
        height: 25,
        width: 25,
      ),
    ),
  );
}

//
// const GetStartedButton(),
// Padding(
// padding: EdgeInsets.symmetric(
// vertical: MediaQuery.of(context).size.height / 40),
// child: Container(
// color: Colors.transparent,
// child: Center(
// child: Text(
// LKeys.signInWithAnotherWay,
// style: MyTextStyle.poppinsRegular(
// size: 18, color: kSubTextColor),
// ),
// ),
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// icon(MyImages.google.tr, () {
// Get.to(() =>  HomeScreen());
// }, const EdgeInsets.only(top: 8, left: 4)),
// icon(MyImages.instagram.tr, () {}, const EdgeInsets.all(10)),
// icon(MyImages.mobile.tr, () {
// Get.to(() =>  MobileLogin());
// }, const EdgeInsets.all(8)),
// icon(MyImages.twitter.tr, () {}, const EdgeInsets.all(8))
// ],
// )
