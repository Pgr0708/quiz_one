import 'package:elite_quiz/controller/get_started_controller.dart';
import 'package:elite_quiz/screens/start_quiz_screen.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/baseController.dart';
import '../localization/localization.dart';
import '../subparts/getstarted_screen_subparts.dart';
import '../utils/const.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStartedController controller = GetStartedController();
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          backgroundColor: kBaseColorOne,
          appBar: AppBar(
            backgroundColor: kBaseColorTwo,
            automaticallyImplyLeading: false,
            title:controller.activePage > 0?  Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: GestureDetector(
                onTap: () {controller.decrement();},
                child: Text(LKeys.back.tr,
                    style: MyTextStyle.poppinsSemiBold(
                        size: 15, color: Colors.grey)),
              ),
            ):Container(),
            actions: [
              controller.activePage < 2?Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: GestureDetector(
                  onTap: () {controller.increment();},
                  child: Text(LKeys.next.tr,
                      style: MyTextStyle.poppinsSemiBold(
                          size: 15, color: Colors.grey)),
                ),
              ):Container(),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Device.height / 1.3,
                width: double.infinity,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller.pageViewController,
                    onPageChanged: (int index) {
                      controller.onPageChanged(index);
                    },
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const Pageview();
                    }),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List<Widget>.generate(
                          3,
                              (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: InkWell(
                              onTap: () {
                                controller.pageViewController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Container(
                                width: controller.activePage == index ? 45 : 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.activePage == index
                                      ? kTitleTextColor
                                      : kSubSubTextColor,
                                ),
                                child: CircleAvatar(
                                  radius: 6,
                    // check if a dot is connected to the current page
                    // if true, give it a different color
                                  backgroundColor: controller.activePage == index
                                      ? kTitleTextColor
                                      : kSubSubTextColor,
                                ),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(width: Device.width/5,),
                    Expanded(child: OnlyTextContainer(text: LKeys.next.tr, colorchange: false, func: (){Get.to(() => Bottomsheet1());})),// const GetStartedButton(),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // Spacer(),
            ],
          ),
        );
      }
    );
  }
}



