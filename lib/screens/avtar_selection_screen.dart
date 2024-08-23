import 'package:elite_quiz/controller/edit_controller.dart';
import 'package:elite_quiz/screens/start_quiz_screen.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/baseController.dart';
import '../localization/localization.dart';
import '../subparts/dpwithcamera_withrank.dart';
import '../subparts/icon_text_switch.dart';
import '../subparts/login_screen_subparts/placeholder_gesturedoctor.dart';
import '../utils/const.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    EditController controller = EditController();
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return Scaffold(
            appBar: Appbar1(
              text: LKeys.editprofile.tr,
              isBackButton: true,
              isBottom: false,
              isActions: false,
            ),
            body: SingleChildScrollView(
              child: Container(
                width: Device.width,
                height: Device.height,
                decoration: BoxDecoration(
                  color: kBlueGreyBack,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      DPWithCameraAndRing(
                        textInCircle: false,
                        score: false,
                        first: false,
                        text: '',
                        topperName: '',
                        topperScrore: '',
                        isCamera: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                            child: Text(LKeys.or.tr,
                                style: MyTextStyle.poppinsRegular(
                                    size: 15, color: kSubTextColor))),
                      ),
                      PlaceHolder(
                        words: LKeys.parthGohil.tr,
                        isInviteCode: false,
                        isPrefix: true,
                        prefixIcon: prefixSuffixIcon(MyImages.name, () {}),
                        isSuffix: false, onChanged: (String data) {  },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kTitleColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            IconTextSwitch(
                              on: controller.on,
                              text: LKeys.iHaveInviteCode.tr,
                              switchpresent: true,
                              iconpresent: false,
                              ontap: controller.toggleSwitch,
                              isInviteCode:
                                  controller.on == true ? true : false,
                            ),
                            controller.on == true
                                ? PlaceHolder(
                                    words: LKeys.enterRefferalCode.tr,
                                    isInviteCode: true,
                                    isPrefix: false,
                                    prefixIcon: Container(),
                                    isSuffix: false,
                                    onChanged: (String data) {},
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OnlyTextContainer(
                          text: LKeys.continueOnly.tr,
                          colorchange: false,
                          func: () {
                            Get.to(() => HomeScreen());
                          })
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 8.0),
                      //   child: Container(
                      //     height: 60,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Pink,
                      //     ),
                      //     child: TextButton(
                      //         onPressed: () {},
                      //         child: Text(
                      //           'Continue',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w500,
                      //               fontSize: 25),
                      //         )),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class Switch1 extends StatelessWidget {
  const Switch1({super.key, required this.func});
  final Function func;
  @override
  Widget build(BuildContext context) {
    SwitchController controller = SwitchController();
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return Switch(
            thumbColor: const MaterialStatePropertyAll(Colors.white),
            thumbIcon: const MaterialStatePropertyAll(Icon(
              Icons.call,
              color: Colors.white,
            )),
            activeTrackColor: kBaseColorOne,
            inactiveTrackColor: kContColor,
            value: controller.isSwitched,
            onChanged: (value) {
              func();
              controller.onPressed(value);
            },
            // trackColor:
            // const MaterialStatePropertyAll(Pink),
            activeColor: Colors.white,
          );
        });
  }
}

// class DPWithCameraAndRing extends StatefulWidget {
//   const DPWithCameraAndRing({super.key, required this.textInCircle, required this.score,  this.text, this.topperName, this.topperScrore, required this.first});
//   final bool textInCircle;
//   final bool score;
//   final String? text;
//   final String? topperName;
//   final String? topperScrore;
//   final bool first;
//
//   @override
//   State<DPWithCameraAndRing> createState() => _DPWithCameraAndRingState();
// }
//
// class _DPWithCameraAndRingState extends State<DPWithCameraAndRing> {
//   final picker = ImagePicker();
//   File? _selectedImage;
//   Future<void> _pickImageFromGallery() async {
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage == null) return;
//
//     setState(() {
//       _selectedImage = File(pickedImage.path);
//     });
//   }
//
//   Future<void> _pickImageFromCamera() async {
//     final pickedImage = await picker.pickImage(source: ImageSource.camera);
//     if (pickedImage == null) return;
//
//     setState(() {
//       _selectedImage = File(pickedImage.path);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return               Column(
//       children: [
//         Center(
//           child: Stack(
//             children: [
//               Stack(children: [
//                  Dp(
//                   height:widget.textInCircle&&!widget.first? 110:widget.first?140:150,
//                   width:widget.textInCircle&&!widget.first? 110: widget.first?140:150,
//                   color:widget.textInCircle? Colors.grey:Colors.white,
//                   borderwidth: 1,
//                   margin: widget.first?15:10,
//                   backgroundcolor: Colors.transparent,
//                 ),
//                 Dp(
//                   height:widget.textInCircle&&!widget.first? 100:130,
//                   width:widget.textInCircle&&!widget.first? 100: 130,
//                   color: Colors.grey,
//                   borderwidth: 0,
//                   widget: ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: const Image(
//                           image: AssetImage('images/dp1.png'),
//                           fit: BoxFit.cover)),
//                   margin:widget.textInCircle&&!widget.first? 15:20,
//                   backgroundcolor: Colors.green,
//                 ),
//               ]),
//               Positioned(
//                 top:widget.textInCircle&&!widget.first? 99: 136,
//                 left:widget.textInCircle&&!widget.first? 52: 70,
//                 child: Container(
//                   height: 34,
//                   padding: EdgeInsets.all(0),
//                   decoration:  BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: White,border: Border.all(color: Colors.white,width: 3),),
//                   child:ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child:widget.textInCircle? Container(color: Pink,padding: EdgeInsets.symmetric(vertical: 3,horizontal: 9),child: Text(widget.text!,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)):  FloatingActionButton(backgroundColor: Colors.white,
//                       onPressed: () => _pickImageFromCamera(),
//                       tooltip: 'Pick Image from camera',
//                       child: const Icon(Icons.add_a_photo_sharp,color: Pink,size: 16,),
//                     ),
//                   ),),),],
//           ),
//         ),
//         widget.score? SizedBox(height: 5,):SizedBox(),
//         widget.score?Text(widget.topperName!,style: BlackText17):SizedBox(),
//         widget.score? SizedBox(height: 5,):SizedBox(),
//         widget.score?Center(child: Text(widget.topperScrore!,style: BlackText28),):SizedBox(),
//       ],
//     );
//   }
// }
