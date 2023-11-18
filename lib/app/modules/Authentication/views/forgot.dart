import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:taskappfirebase/app/modules/Authentication/views/login_view.dart';
import 'package:taskappfirebase/app/modules/profile/functions/text_field.dart';

class ForgotPssWord extends StatelessWidget {
  ForgotPssWord({super.key});
    final  AuthController authController  =Get.put(AuthController());

  final emailforgotcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
        double wt= MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          
          child: Column(
            children: [
                Container(
              width: wt,
              height:ht*0.3,
              decoration: const BoxDecoration(
                image:DecorationImage(image:AssetImage("assets/img/signup.jpg"),
                fit: BoxFit.cover)
              ),
            ),
           const SizedBox(height: 60,),
          Container(
            padding:EdgeInsets.all(10),
            child: const Column(
              children: [
               Padding(
                 padding: EdgeInsets.only(right: 140,bottom: 10), 
                 child: Text("Forget Password",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
               ),
               Text("Select one of the options given below to reset your password",style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
              ]
             ),
          ),SizedBox(height: 20,),
          buildTextFormField(
            controller: emailforgotcontroller,
            label: "Email",
            prefixIcon: Icons.email,
          ),
          SizedBox(height: 20,),
           GestureDetector(
            onTap: (){
              authController.sendPasswordResetEmail(emailforgotcontroller.text);
            },
             child: Container(
              width: wt*0.5,
              height:ht*0.08,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image:const DecorationImage(image:AssetImage("assets/img/by.jpg"),
                fit: BoxFit.cover)
              ),
              child:const Center(child: Text("Reset Password ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),)),
                   ),
           ),
      
            ],
          ),
          
        ),
      ),
    );
  }
}
