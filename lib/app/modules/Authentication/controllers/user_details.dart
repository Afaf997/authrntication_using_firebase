// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:taskappfirebase/app/data/Model/user_model.dart';


// class UserRepository extends GetxController{
//   static UserRepository get instance =>Get.find();

//   final _db = FirebaseFirestore.instance;
//   createUser(UserModel usermodel)async{
//    await _db.collection("User_Details").add(usermodel.toJson()).whenComplete(() => 
//     Get.snackbar("Success", "you account has been created",
//     snackPosition: SnackPosition.BOTTOM,
//     backgroundColor: Colors.green.withOpacity(0.1),
//     colorText: Colors.green)).
//     catchError((error ,stacTrace){
//       Get.snackbar("Error", "something went wrong.try again",
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.redAccent.withOpacity(0.1),
//       colorText: Colors.red);
//       print(error.toString());
//     });
//   }

// }