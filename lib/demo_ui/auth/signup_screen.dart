import 'package:elite_quiz/controller/users_model.dart';
import 'package:elite_quiz/demo_ui/auth/login_screen.dart';
import 'package:elite_quiz/demo_ui/auth/retrieve_data.dart';
import 'package:elite_quiz/demo_ui/auth/verify_screen.dart';
import 'package:elite_quiz/demo_widgets/round_button.dart';
import 'package:elite_quiz/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../localization/localization.dart';
import '../../utils/extentions/font_extention.dart';
import '../utils/utils.dart';

class SignUpScreenOne extends StatefulWidget {
  const SignUpScreenOne({super.key});

  @override
  State<SignUpScreenOne> createState() => _SignUpScreenOneState();
}

class _SignUpScreenOneState extends State<SignUpScreenOne> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final UserRepository _userRepository = Get.put(UserRepository());
  final UserRepository _userCatchData = Get.put(UserRepository());
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // int id=1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
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
                    hintText: '+1 234 3455 678',
                    prefixIcon: Icon(Icons.phone, size: 20),
                  ),
                  // validator: (value) {
                  //   if (!value!.isNotEmpty) {
                  //     return 'Enter Email';
                  //   }
                  //   return null;
                  // },
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
                  // validator: (value) {
                  //   if (!value!.isNotEmpty) {
                  //     return 'Enter Password';
                  //   }
                  //   return null;
                  // },
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
              data: 'Sign Up',
              onTap: () {
                // if (_formKey.currentState!.validate()) {

                // print("-------------------------------------");
                // try {
                final user = UsersModel(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
                _userRepository.createUser(user);

                _auth.createUserWithEmailAndPassword(
                    email: emailController.text.toString(),
                    password: passwordController.text.toString());

                Get.to(() => RetrieveData(emailController: emailController, passwordController: passwordController));

                // _auth.verifyPhoneNumber(
                //     phoneNumber: phoneNumberController.text.toString(),
                //     verificationCompleted: (PhoneAuthCredential credential) {},
                //     verificationFailed: (FirebaseAuthException ex) {
                //       Utils().toastMessage(ex.toString());
                //     },
                //     codeSent: (String verificationid, int? resendtoken) {
                //       Get.to(() =>
                //           VerifyScreen(verificationid: verificationid));
                //     },
                //     codeAutoRetrievalTimeout: (String verificationId) {
                //       // Utils().toastMessage(ex.toString());
                //     });
                // } catch (e) {
                //   print("=========================================$e");
                // }
                // }
                // googleLogin();
                // print('${emailController.text}');
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
                  LKeys.alreadyHaveAcc.tr,
                  style:
                      MyTextStyle.poppinsRegular(size: 12, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreenOne());
                  },
                  child: Text(
                    LKeys.logIN.tr,
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

  void googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    print("Hello");
    if (googleSignInAccount != null) {
      // var user = Party(googleSignInAccount.displayName, googleSignInAccount.email);
      // SessionManager.shared.setUser(user);
      // SessionManager.shared.setLogin(true);
      print("Complete");
      // print(SessionManager.shared.isLogin());
      Get.offAll(() => HomeScreen());
    }
  }
}

// import 'package:firebase_core/firebase_core.dart';
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //       options: FirebaseOptions(
// //         apiKey: 'AIzaSyBH1CakRgbwQCn7oJMVHrpcm2alnDOtIps',
// //         appId: '1:407681848602:android:cfd339131487c955c148a3',
// //         messagingSenderId: '407681848602',
// //         projectId: 'centillionelitequiz',
// //         storageBucket: 'centillionelitequiz.appspot.com',   ));
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Phone Number Signup',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: PhoneNumberSignupScreen(),
// //     );
// //   }
// // }
//
// class PhoneNumberSignupScreen extends StatefulWidget {
//   @override
//   _PhoneNumberSignupScreenState createState() => _PhoneNumberSignupScreenState();
// }
//
// class _PhoneNumberSignupScreenState extends State<PhoneNumberSignupScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final _formKey = GlobalKey<FormState>();
//   String _phoneNumber = '';
//   String _verificationId = '';
//   String _smsCode = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Number Signup'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a phone number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _phoneNumber = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     await _verifyPhoneNumber();
//                   }
//                 },
//                 child: Text('Verify Phone Number'),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Verification Code',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a verification code';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _smsCode = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     await _signInWithPhoneNumber();
//                   }
//                 },
//                 child: Text('Sign in with Phone Number'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _verifyPhoneNumber() async {
//     final PhoneVerificationCompleted verificationCompleted =
//         (PhoneAuthCredential credential) async {
//       await _auth.signInWithCredential(credential);
//     };
//
//     final PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException e) {
//       print('Verification failed: ${e.message}');
//     };
//
//     final PhoneCodeSent codeSent =
//         (String verificationId, int? resendToken) async {
//       _verificationId = verificationId;
//     };
//
//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationId) {
//       _verificationId = verificationId;
//     };
//
//     await _auth.verifyPhoneNumber(
//       phoneNumber: _phoneNumber,
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );
//   }
//
//   Future<void> _signInWithPhoneNumber() async {
//     final PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: _verificationId,
//       smsCode: _smsCode,
//     );
//
//     await _auth.signInWithCredential(credential);
//   }
// }
