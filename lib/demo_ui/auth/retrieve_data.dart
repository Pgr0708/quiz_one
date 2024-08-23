import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/users_model.dart';
import '../../demo_widgets/round_button.dart';

class RetrieveData extends StatefulWidget {
  const RetrieveData({
    super.key, this.email,
    required this.emailController,
    required this.passwordController,
  });
  // final UsersModel user;
  final email;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  State<RetrieveData> createState() => _RetrieveDataState();
}

class _RetrieveDataState extends State<RetrieveData> {
  final userRepository = UserRepository.instance;
  final TextEditingController emailController2 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  Future<UsersModel>? _allUsers;
  updateRecord(UsersModel user) async {
    await userRepository.UpdateUser(user);
    print('Updated user: ${user.email} ${user.password}');
  }

  @override
  void initState() {
    super.initState();
    _allUsers = userRepository.getUserDetails(widget.email);
  }

  final _formKey = GlobalKey<FormState>();
  int id = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Data'),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Form(
      //       key: _formKey,
      //       child: Column(children: [
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //           child: TextFormField(
      //             keyboardType: TextInputType.emailAddress,
      //             controller: emailController2,
      //             decoration: InputDecoration(
      //               hintText: "${widget.emailController.text.toString()}",
      //               prefixIcon: Icon(Icons.phone, size: 20),
      //             ),
      //             // validator: (value) {
      //             //   if (!value!.isNotEmpty) {
      //             //     return 'Enter Email';
      //             //   }
      //             //   return null;
      //             // },
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //           child: TextFormField(
      //             keyboardType: TextInputType.text,
      //             obscureText: true,
      //             controller: passwordController2,
      //             decoration: InputDecoration(
      //               hintText: "${widget.passwordController.text.toString()}",
      //               prefixIcon: Icon(Icons.password_rounded, size: 20),
      //             ),
      //             // validator: (value) {
      //             //   if (!value!.isNotEmpty) {
      //             //     return 'Enter Password';
      //             //   }
      //             //   return null;
      //             // },
      //           ),
      //         ),
      //       ]),
      //     ),
      //     SizedBox(
      //       height: 50,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //       child: RoundButton(
      //         data: 'Update',
      //         onTap: () {
      //           print('onTap callback called');
      //           if (_formKey.currentState!.validate()) {
      //             print('Form is valid');
      //             _formKey.currentState!.save();
      //             final userData = UsersModel(
      //                 email: emailController2.text.trim(),
      //                 password: passwordController2.text.trim(),
      //                 id: '1');
      //             if (userRepository != null) {
      //               updateRecord(userData);
      //               print(
      //                   'Updated widget.emailController: ${widget.emailController.text}');
      //               print(
      //                   'Updated widget.passwordController: ${widget.passwordController.text}');
      //               emailController2.clear();
      //               passwordController2.clear();
      //             } else {
      //               print('userRepository is null');
      //             }
      //           }
      //
      //           // if (_formKey.currentState!.validate()) {
      //
      //           // print("-------------------------------------");
      //           // try {
      //           // final user = UsersModel(
      //           //     email: emailController.text.trim(),
      //           //     password: passwordController.text.trim(), id: '${id++}');
      //           // _userRepository.createUser(user);
      //           //
      //           // _auth.createUserWithEmailAndPassword(
      //           //     email: emailController.text.toString(),
      //           //     password: passwordController.text.toString());
      //           // _auth.verifyPhoneNumber(
      //           //     phoneNumber: phoneNumberController.text.toString(),
      //           //     verificationCompleted: (PhoneAuthCredential credential) {},
      //           //     verificationFailed: (FirebaseAuthException ex) {
      //           //       Utils().toastMessage(ex.toString());
      //           //     },
      //           //     codeSent: (String verificationid, int? resendtoken) {
      //           //       Get.to(() =>
      //           //           VerifyScreen(verificationid: verificationid));
      //           //     },
      //           //     codeAutoRetrievalTimeout: (String verificationId) {
      //           //       // Utils().toastMessage(ex.toString());
      //           //     });
      //           // } catch (e) {
      //           //   print("=========================================$e");
      //           // }
      //           // }
      //           // googleLogin();
      //           // print('${emailController.text}');
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: 50,
      //     ),
      //   ],
      // ),
      body: FutureBuilder(
        future: _allUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final allUsers = snapshot.data!;
              final user = allUsers;
            return
              // ListView.builder(
              // itemCount: allUsers.length,
              // itemBuilder: (context, index) {
              //   final user = allUsers[index];
              //   return
                  ListTile(
                  subtitle: Column(
                    children: [
                      Text(user.email),
                      Text(user.password),
                    ],
                  ),
                );
            //   },
            // );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
