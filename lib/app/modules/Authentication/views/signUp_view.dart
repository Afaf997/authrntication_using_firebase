
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/details_user.dart';
import 'package:taskappfirebase/app/modules/Authentication/functions/signup_textfilds.dart';
// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key, this.isEditing = false, this.student}): super(key: key);
  final UserDeatailsController userController = Get.find<UserDeatailsController>();

  String imageUrl = '';
  String selectFileName = '';
  final bool isEditing;
  final Map<String, dynamic>? student;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var usernameController = TextEditingController();
    var phonenumberController = TextEditingController();

    if (isEditing && student != null) {
      usernameController.text = student!['name'];
      phonenumberController.text = student!['phone'];
    }
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
             const Stack(children: [
                 CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/img/avathar.jpg"),
                ),
              ]),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                width: wt,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "Hello",
      style: TextStyle(fontSize: 67, fontWeight: FontWeight.bold),
    ),
    Text(
      "Sign up for a new account",
      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
    ),
    const SizedBox(height: 50),
    buildRegistrationInputContainer(
      controller: usernameController,
      hintText: "Name",
      prefixIcon: Icons.person,
    ),
    const SizedBox(height: 20),
    buildRegistrationInputContainer(
      controller: emailController,
      hintText: "Email",
      prefixIcon: Icons.email,
    ),
    const SizedBox(height: 20),
    buildRegistrationInputContainer(
      controller: passwordController,
      hintText: "Password",
      prefixIcon: Icons.password,
      obscureText: true,
    ),
    const SizedBox(height: 20),
    buildRegistrationInputContainer(
      controller: phonenumberController,
      hintText: "Phone number",
      prefixIcon: Icons.phone,
    ),
  ],
)],),),
              const SizedBox(height: 70),
  GestureDetector(
                onTap: () async {
                  if (isEditing) {
                    await userController.updateStudent(student!['id'], {
                      "name": usernameController.text,
                      "phone": phonenumberController.text,
                      "email":emailController.text
                    });
                  } else {
                    await FirebaseFirestore.instance.collection("User_Details").add({
                      "name": usernameController.text,
                      "phone": phonenumberController.text,
                      "email":emailController.text
                    });
                  }
                  userController.fetchUserDetails();
                   FocusScope.of(context).unfocus();
                  AuthController.instance.register(emailController.text,passwordController.text,usernameController.text,int.parse(phonenumberController.text)); 
                },
                child: Container(
                  width: wt * 0.5,
                  height: ht * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage("assets/img/by.jpg"),
                          fit: BoxFit.cover)),
                  child: const Center(child: Text("Sign up ",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account?",
                style: TextStyle(color: Colors.grey[500], fontSize: 18),
              )),
              const SizedBox(
                height: 30,
              ),
              RichText(
                  text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Sign up using one of the following methods",
                style: TextStyle(color: Colors.grey[500], fontSize: 13),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
