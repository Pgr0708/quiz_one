import 'package:elite_quiz/demo_ui/auth/retrieve_data.dart';
import 'package:elite_quiz/demo_ui/auth/signup_screen.dart';
import 'package:elite_quiz/demo_widgets/round_button.dart';
import 'package:elite_quiz/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../localization/localization.dart';
import '../../utils/const.dart';
import '../../utils/extentions/font_extention.dart';
import '../utils/utils.dart';

class LoginScreenOne extends StatefulWidget {
  const LoginScreenOne({super.key});

  @override
  State<LoginScreenOne> createState() => _LoginScreenOneState();
}

class _LoginScreenOneState extends State<LoginScreenOne> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  void login() {
    _auth
        .signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.toString().toString())
        .then(
          (value) {},
        )
        .onError(
      (error, stackTrace) {
        debugPrint(error.toString());
        Utils().toastMessage(error.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined, size: 20),
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password_rounded, size: 20),
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RoundButton(
              data: 'Login',
              onTap: () {
              login();
              // Get.to(() => RetrieveData(emailController: emailController,passwordController: passwordController,));
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  LKeys.dontHaveAcc.tr,
                  style:
                      MyTextStyle.poppinsRegular(size: 12, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to(() => SignUpScreenOne());
                  },
                  child: Text(
                    LKeys.signUp.tr,
                    style: MyTextStyle.poppinsRegular(
                        size: 14, color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// class LoginScreenTwo extends StatefulWidget {
//   const LoginScreenTwo({super.key});
//
//   @override
//   State<LoginScreenTwo> createState() => _LoginScreenTwoState();
// }
//
// class _LoginScreenTwoState extends State<LoginScreenOne> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   void login() {
//     _auth
//         .signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.toString().toString())
//         .then(
//           (value) {},
//     )
//         .onError(
//           (error, stackTrace) {
//         debugPrint(error.toString());
//         Utils().toastMessage(error.toString());
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           "Login",
//           style: TextStyle(color: Colors.white),
//         ),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Form(
//             key: _formKey,
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     prefixIcon: Icon(Icons.email_outlined, size: 20),
//                   ),
//                   validator: (value) {
//                     if (value!.isNotEmpty) {
//                       return 'Enter Email';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.text,
//                   obscureText: true,
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     prefixIcon: Icon(Icons.password_rounded, size: 20),
//                   ),
//                   validator: (value) {
//                     if (value!.isNotEmpty) {
//                       return 'Enter Password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ]),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: RoundButton(
//               data: 'Login',
//               onTap: () {
//                 login();
//                 Get.to(() => RetrieveData());
//               },
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Row(
//               children: [
//                 Text(
//                   LKeys.dontHaveAcc.tr,
//                   style:
//                   MyTextStyle.poppinsRegular(size: 12, color: Colors.black),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Get.to(() => SignUpScreenOne());
//                   },
//                   child: Text(
//                     LKeys.signUp.tr,
//                     style: MyTextStyle.poppinsRegular(
//                         size: 14, color: Colors.deepPurple),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }