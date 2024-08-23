import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersModel {
  final String? id;
  final String email;
  final String password;
  const UsersModel({this.id,required this.email, required this.password,});
  toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  factory UsersModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UsersModel(
        id: document.id,email: data["email"], password: data["password"]);
  }
}

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UsersModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() =>
        Get.snackbar(
            "Success", "You have completly created account",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green))
        .catchError(
          (error, stackTrace) {
        Get.snackbar("Fail", "Something went wrong , try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red);
        print(error.toString());
      },
    );
  }

  Future<UsersModel> getUserDetails(String email) async {
    final snapshot =
    await _db.collection("Users").where("email", isEqualTo: email).get();
    final userData =
        snapshot.docs
            .map((e) => UsersModel.fromSnapshot(e))
            .single;
    return userData;
  }

  Future<List<UsersModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
    snapshot.docs.map((e) => UsersModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> UpdateUser(UsersModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
  // Future<void> UpdateUser(UsersModel user) async {
  //   await _db.collection("Users").doc("email").update(
  //       { // Replace with the actual document ID
  //         "email": user.email,
  //         "password": user.password,
  //         "id": user.id,
  //       });
  //   print('Updated user: ${user.email} ${user.password}');
  // }
  // Future<void> UpdateUser(UsersModel user) async {
  //   // Query the Users collection to find the document with the existing email
  //   QuerySnapshot querySnapshot = await _db
  //       .collection("Users")
  //       .where("email", isEqualTo: user.email) // assuming oldEmail is the existing email
  //       .get();
  //
  //   // Check if the document exists
  //   if (querySnapshot.docs.isNotEmpty) {
  //     DocumentReference docRef = querySnapshot.docs.first.reference;
  //     await docRef.update({
  //       "email": user.email,
  //       "password": user.password,
  //     });
  //     print('Updated user: ${user.email} ${user.password}');
  //   } else {
  //     print('User not found');
  //   }
  // }
}
