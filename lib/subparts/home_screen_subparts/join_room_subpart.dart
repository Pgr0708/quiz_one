import 'package:elite_quiz/screens/group_battel_screen_one.dart';
import 'package:elite_quiz/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_fields/otp_fields.dart';

import '../../localization/localization.dart';


class JoinRoomBottomSheet extends StatelessWidget {
  const JoinRoomBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),      color: Colors.grey.withOpacity(0.2),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Appbar(text: "Join Room", title_color: Colors.black, backbutton_color: Colors.black, padding_right: 30, padding_left: 0, backbutton: true, widgett: Container(),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back,color: Colors.black,size: 25,),
              onPressed: () {
                Navigator.pop(context); // Pop the current route
              },
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 45.0),
              child: Text(LKeys.joinRoom.tr,style:const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 25),textAlign: TextAlign.center),
            )),
          ],
        ),
          Divider(
            thickness: 1, // thickness of the divider
            color: Colors.black.withOpacity(0.5), // color of the divider
            indent: 0, // indentation from the left
            endIndent: 0, // indentation from the right
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(child: Text(LKeys.enterCodeJoin.tr,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.black,),)),
          ),
          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 4),
            child: OtpFieldsCustom
              (
              backgroundColor: Colors.grey.withOpacity(0.8),
                emptyBorderColor: Colors.transparent,
                focusedBorderColor: kPink,
                filledBorderColor: Colors.transparent,
                context: context,
                numberOfFields: 6,
                style: const TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500,),
                onCodeChanged: (otp) {
                  ///handle otp
                })
              ,
            // child: OtpTextField(
            //   numberOfFields: 6,
            //   borderColor:Colors.red,
            //   showFieldAsBox: true,
            //   fieldWidth: 40, // Set the width of each field
            //   fieldHeight: 40, // Set the height of each field
            //   borderWidth: 2, // Set the border width
            //   borderRadius: BorderRadius.circular(10), // Set the border radius
            //   cursorColor: Colors.black, // Set the cursor color
            //   textStyle: TextStyle(fontSize: 17, color: Colors.black), // Set the text style
            //   onCodeChanged: (String code) {
            //     //handle validation or checks here
            //   },
            //   onSubmit: (String verificationCode){
            //     showDialog(
            //         context: context,
            //         builder: (context){
            //           return AlertDialog(
            //             title: Text("Verification Code"),
            //             content: Text('Code entered is $verificationCode'),
            //           );
            //         }
            //
            //     );
            //   }, // end onSubmit
            // ),
          ),
          const SizedBox(height: 40,),
          OnlyTextContainer(text: LKeys.joinRoom.tr, colorchange: false, func: (){},),
        ],
      ),
    );
  }
}
