import 'package:elite_quiz/controller/demo_controller.dart';
import 'package:elite_quiz/localization/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/get_started_screen.dart';
import '../screens/group_battel_screen_one.dart';
import '../subparts/language_screen_subparts.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    DemoController controller = DemoController();
    return GetBuilder(
      init: controller,
      builder: (controller) {
        print("object");
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const MyToggleButtons(),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: OnlyTextContainer(
                  text: LKeys.letStart.tr,
                  colorchange: false,
                  func: () {
                    Get.to(() => GetStartedScreen());
                  },
                ),
              ),
            ],
          ),
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   child: Center(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         GetBuilder<DemoController>(
          //           init: controller,
          //           id: "increase",
          //           builder: (controller) {
          //             return GestureDetector(
          //               onTap: () {
          //                 controller.increment();
          //               },
          //               child: Icon(
          //                 CupertinoIcons.plus_circle,
          //                 size: 40,
          //                 color: Colors.green,
          //               ),
          //             );
          //           }
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //           child: Text(
          //             // '${controller.num}',
          //             LKeys.letStart.tr,
          //             style: TextStyle(
          //                 color: Colors.grey,
          //                 fontSize: 40,
          //                 fontWeight: FontWeight.w500),
          //           ),
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             controller.decrement();
          //           },
          //           child: Icon(
          //             CupertinoIcons.minus_circle,
          //             size: 40,
          //             color: Colors.green,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        );
      }
    );
  }
}
