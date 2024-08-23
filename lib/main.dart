import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_quiz/controller/demo_screen.dart';
import 'package:elite_quiz/demo_ui/auth/login_screen.dart';
import 'package:elite_quiz/demo_ui/auth/signup_screen.dart';
import 'package:elite_quiz/localization/localization.dart';
import 'package:elite_quiz/pages_todo/home_page.dart';
import 'package:elite_quiz/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controller/baseController.dart';
import 'controller/users_model.dart';
import 'demo_ui/splash_screen.dart';

//  .\gradlew signingReport
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBH1CakRgbwQCn7oJMVHrpcm2alnDOtIps',
        appId: '1:407681848602:android:cfd339131487c955c148a3',
        messagingSenderId: '407681848602',
        projectId: 'centillionelitequiz',
        storageBucket: 'centillionelitequiz.appspot.com',   ));
  runApp(
   MyApp(),
  );
  Get.put(UserRepository());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  void initState() {
    SessionManager manager = SessionManager();
    manager.setIsLanguageSet(false);
    if (kDebugMode) {
      print("${manager.getIsLanguageSet()}");
    }
  }

  void dispose() {}
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   HomeScreen1(),
    );
  }
}


class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Store email and password in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'email': _emailController.text,
        'password': _passwordController.text, // Store password as well
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User signed up!")));
      Navigator.pop(context); // Navigate back to the home screen
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to sign up")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}



class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User logged in!")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserListScreen()),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to login")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}





class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    _currentUser = _auth.currentUser;

    if (_currentUser != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(_currentUser!.uid).get();
      if (userDoc.exists) {
        setState(() {
          _emailController.text = userDoc['email'];
          _passwordController.text = userDoc['password'];
        });
      }
    }
  }

  void _updateUser() async {
    try {
      if (_currentUser != null) {
        await _firestore.collection('users').doc(_currentUser!.uid).update({
          'email': _emailController.text,
          'password': _passwordController.text, // Update password as well
        });

        await _currentUser!.updateEmail(_emailController.text);
        await _currentUser!.updatePassword(_passwordController.text);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User updated!")));
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update")));
    }
  }

  void _deleteUser() async {
    try {
      if (_currentUser != null) {
        await _firestore.collection('users').doc(_currentUser!.uid).delete();
        await _currentUser!.delete();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User deleted!")));
        Navigator.pop(context); // Navigate back to the previous screen
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to delete")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: _currentUser?.email ?? 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUser,
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: _deleteUser,
              child: Text('Delete'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// import 'package:uuid/data.dart';
// import 'package:uuid/uuid.dart';
// import 'package:uuid/rng.dart';
//
// void main() {
//   var uuid = Uuid();
//
//   // Generate a v1 (time-based) id
//   var v1 = uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
//
//   var v1Exact = uuid.v1(
//       config: V1Options(
//           0x1234,
//           DateTime.utc(2011, 11, 01).millisecondsSinceEpoch,
//           5678,
//           [0x01, 0x23, 0x45, 0x67, 0x89, 0xab],
//           null)); // -> '710b962e-041c-11e1-9234-0123456789ab'
//
//   // Generate a v4 (random) id
//   var v4 = uuid.v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
//
//   // Generate a v4 (crypto-random) id
//   var v4Crypto = uuid.v4(config: V4Options(null, CryptoRNG()));
//   // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
//
//   // Generate a v5 (namespace-name-sha1-based) id
//   var v5 = uuid.v5(Uuid.NAMESPACE_URL, 'www.google.com');
//   // -> 'c74a196f-f19d-5ea9-bffd-a2742432fc9c'
//
//   // Generate a v6 (time-based) id
//   var v6 = uuid.v6(); // -> '1ebbc608-7459-6a20-bc85-0d10b6a52acd'
//
//   var v6Exact = uuid.v6(
//       config: V6Options(
//           0x1234,
//           DateTime.utc(2011, 11, 01).millisecondsSinceEpoch,
//           5678,
//           [0x01, 0x23, 0x45, 0x67, 0x89, 0xab],
//           null)); // -> '1e1041c7-10b9-662e-9234-0123456789ab'
//
//   // Generate a v7 (time-based) id
//   var v7 = uuid.v7(); // -> 060ab53c-0bb2-7482-8000-ab029e8fa2ea
//
//   var v7Exact = uuid.v7(
//       config: V7Options(
//           DateTime.utc(2011, 10, 9, 8, 7, 6, 543, 210).millisecondsSinceEpoch, [
//         0x01,
//         0x23,
//         0x45,
//         0x67,
//         0x89,
//         0xab,
//         0x01,
//         0x23,
//         0x45,
//         0x67
//       ])); // -> '04e91562-0884-7fea-9234-0123456789ab'
//
//   // Generate a v8 (time-random) id
//   var v8 = uuid.v8(); // -> '1e1041c7-10b9-662e-9234-0123456789ab'
//
//   var v8Exact = uuid.v8(
//       config: V8Options(DateTime.utc(2011, 10, 9, 8, 7, 6, 543, 210), [
//         0x01,
//         0x23,
//         0x45,
//         0x67,
//         0x89,
//         0xab,
//         0x01,
//         0x23,
//         0x45,
//         0x67
//       ])); // -> '1e1041c7-10b9-662e-9234-0123456789ab'
//
//   print('v1        | $v1');
//   print('v1 exact  | $v1Exact');
//   print('v4        | $v4');
//   print('v4 crypto | $v4Crypto');
//   print('v5        | $v5');
//   print('v6        | $v6');
//   print('v6 exact  | $v6Exact');
//   print('v7        | $v7');
//   print('v7 exact  | $v7Exact');
//   print('v8        | $v8');
//   print('v8 exact  | $v8Exact');
// }
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// final Uri _url = Uri.parse('https://flutter.dev');
//
// void main() => runApp(
//   const MaterialApp(
//     home: Material(
//       child: Center(
//         child: ElevatedButton(
//           onPressed: _launchUrl,
//           child: Text('Show Flutter homepage'),
//         ),
//       ),
//     ),
//   ),
// );
//
// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }
//



// class LoginScreen1 extends StatefulWidget {
//   @override
//   _LoginScreen1State createState() => _LoginScreen1State();
// }
//
// class _LoginScreen1State extends State<LoginScreen1> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   void _signUp() async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//
//       // Store additional user info in Firestore
//       await _firestore.collection('users').doc(userCredential.user?.uid).set({
//         'email': _emailController.text,
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User signed up!")));
//     } catch (e) {
//       print(e);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to sign up")));
//     }
//   }
//
//   void _login() async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User logged in!")));
//     } catch (e) {
//       print(e);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to login")));
//     }
//   }
//
//   void _update() async {
//     try {
//       User? user = _auth.currentUser;
//
//       if (user != null) {
//         await _firestore.collection('users').doc(user.uid).update({
//           'email': _emailController.text,
//         });
//
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User updated!")));
//       }
//     } catch (e) {
//       print(e);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update")));
//     }
//   }
//
//   void _delete() async {
//     try {
//       User? user = _auth.currentUser;
//
//       if (user != null) {
//         await _firestore.collection('users').doc(user.uid).delete();
//         await user.delete();
//
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User deleted!")));
//       }
//     } catch (e) {
//       print(e);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to delete")));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login / Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _signUp,
//               child: Text('Sign Up'),
//             ),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//             ElevatedButton(
//               onPressed: _update,
//               child: Text('Update'),
//             ),
//             ElevatedButton(
//               onPressed: _delete,
//               child: Text('Delete'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


