import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskappfirebase/app/modules/Authentication/views/login_view.dart';
import 'package:taskappfirebase/app/modules/Authentication/views/welcome_view.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => WelcomeScreen(email:user.email!));
    }
  }

  // Registration
  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("Error during registration: $e");
      Get.snackbar(
        "Account Creation Failed",
        e.toString(),
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("Account creation failed", style: TextStyle(color: Colors.white)),
        messageText: const Text("Please check your email and password and try again.", style: TextStyle(color: Colors.white)),
      );
    }
  }

//login

   void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("Error during registration: $e");
      Get.snackbar(
        "Account Creation Failed",
        e.toString(),
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("Login failed", style: TextStyle(color: Colors.white)),
        messageText: const Text("Please check add email and password and try again.", style: TextStyle(color: Colors.white)),
      );
    }
  }

  //logout
   void logout()async{
    await auth.signOut();
       }
}