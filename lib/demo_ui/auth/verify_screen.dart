import 'dart:math';

import 'package:elite_quiz/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../demo_widgets/round_button.dart';
import '../utils/utils.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key, required this.verificationid});
  final String verificationid;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final phoneNumberController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Verify",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
                decoration: InputDecoration(
                  hintText: '6 digit code',
                  prefixIcon: Icon(Icons.email_outlined, size: 20),
                ),
                // validator: (value) {
                //   if (!value!.isNotEmpty) {
                //     return 'Enter Email';
                //   }
                //   return null;
                // },
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: TextFormField(
            //     keyboardType: TextInputType.text,
            //     obscureText: true,
            //     controller: passwordController,
            //     decoration: InputDecoration(
            //       hintText: 'Password',
            //       prefixIcon: Icon(Icons.password_rounded, size: 20),
            //     ),
            //     // validator: (value) {
            //     //   if (!value!.isNotEmpty) {
            //     //     return 'Enter Password';
            //     //   }
            //     //   return null;
            //     // },
            //   ),
            // ),
          ]),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RoundButton(
              data: 'Verify',
              onTap: () async {
                // if (_formKey.currentState!.validate()) {
                 PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationid,
                    smsCode: phoneNumberController.text.toString());
                try{
                    await auth.signInWithCredential(credential);
                    Get.to(() => HomeScreen());
                }
                catch(e){
                     print(e);
                }
                Utils().toastMessage(e.toString());
              },
            ),
          ),
          // SizedBox(
          //   height: 50,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Row(
          //     children: [
          //       Text(
          //         LKeys.alreadyHaveAcc.tr,
          //         style:
          //         MyTextStyle.poppinsRegular(size: 12, color: Colors.black),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           Get.to(() => LoginScreenOne());
          //         },
          //         child: Text(
          //           LKeys.logIN.tr,
          //           style: MyTextStyle.poppinsRegular(
          //               size: 14, color: Colors.deepPurple),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
