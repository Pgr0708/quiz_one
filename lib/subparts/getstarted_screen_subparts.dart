import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:elite_quiz/screens/login_screen.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/baseController.dart';
import '../localization/localization.dart';
import '../screens/home_screen.dart';
import '../utils/const.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(color: kBaseColorOne, child: Padding(
      padding:
       EdgeInsets.only(left:10,right:10,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: commonLinearGradient,
            ),
            width: Device.width/2-15,
            height: Device.height/9,
            child: TextButton(
              child:  Text(
                LKeys.logIN.tr,
                style:MyTextStyle.poppinsBold(color: kTitleTextColor,size: 20),
              ),
              onPressed: () {
                Get.to(()=>Bottomsheet1());
                  },
            ),
          ),
          SizedBox(width:10,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: commonLinearGradient,
            ),
            width: Device.width/2-15,
            height: Device.width/9,
            child: TextButton(
              child:  Text(
                LKeys.signUp.tr,
                style:MyTextStyle.poppinsBold(color: kTitleTextColor,size: 20),
              ),
              onPressed: () {
                      Get.to(()=>Bottomsheet1());
              },
            ),
          ),

        ],
      ),
    ),);
  }
}


class Pageview extends StatelessWidget {
  const Pageview({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      child: Container(
        color: kBaseColorTwo,
        child: Column(
          children: [
            SizedBox(height: Device.height /20,),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 8),
              height: 200,
              width:250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                MyImages.personOne.tr,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: Device.height /10,),
            Container(
              color: Colors.transparent,
              child:  Center(
                child: Text(
                  LKeys.testKnowledge.tr,
                  style: MyTextStyle.poppinsSemiBold(size: 22,color: kTitleTextColor),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: Device.width/1.3,
              child:  Text(
                LKeys.challengeYourQuizzes.tr,
                style: MyTextStyle.poppinsRegular(color: kSubTextColor,size: 18),
                maxLines: 3,
                overflow: TextOverflow.clip,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
