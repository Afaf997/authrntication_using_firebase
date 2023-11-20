import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskappfirebase/app/modules/Authentication/functions/forgotepassword.dart';
import 'package:taskappfirebase/app/modules/Authentication/functions/login_textfield.dart';
import 'package:taskappfirebase/app/modules/Authentication/views/forgot.dart';
import 'package:taskappfirebase/app/modules/Authentication/views/signUp_view.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
     var emailController =TextEditingController();
     var passwordController =TextEditingController();

    double wt= MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
          Container(
            width: wt,
            height:ht*0.3,
            decoration: const BoxDecoration(
              image:DecorationImage(image:AssetImage("assets/img/profile.avif"),
              fit: BoxFit.cover)
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
            width: wt,
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hello",style: TextStyle(fontSize: 67,fontWeight: FontWeight.bold),),
              Text("Sign into your account",style: TextStyle(fontSize: 20,color: Colors.grey[500]),),
               const SizedBox(height: 50),
    buildInputContainer(
      controller: emailController,
      hintText: "Email",
      prefixIcon: Icons.email,
    ),
    const SizedBox(height: 20),
    buildInputContainer( 
      isPassword: true,
      controller: passwordController,
      hintText: "Password",
      prefixIcon: Icons.password,),
            const SizedBox(height: 20,),
             Row(
              children: [
                 GestureDetector(
                  child: Text("Forgot your account?",style: TextStyle(fontSize: 18,color: Colors.grey[500]),),
                  onTap: (){
                     showModalBottomSheet(context: context,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                   builder: (context)=>Container(
                   padding:const EdgeInsets.all(20),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const Text("Make Selection",style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                     const Text("select one of the options given below to reset yours password",style: TextStyle(fontSize: 15),),
                     const SizedBox( height: 30,),
                     buildGestureDetector(
                         title: "E-mail",
                          subtitle: "Reset via Mail Verification",
                          icon: Icons.mail_outline_rounded,
                           onTap: () {
                            Get.to(ForgotPssWord());
                          },),SizedBox(height: 20),
                    ],
                   ),
                   ));}),
              ],)
             ],
          ),),
         const SizedBox(height: 50,),
           GestureDetector(
            onTap: (){
              AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
            },
             child: Container(
              width: wt*0.5,
              height:ht*0.08,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image:const DecorationImage(image:AssetImage("assets/img/by.jpg"),
                fit: BoxFit.cover)
              ),
              child:const Center(child: Text("Sign in ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                   ),
           ),
         const SizedBox(height:20,),
          RichText(text: TextSpan(text: "Don't have an account?",
          style: TextStyle(color: Colors.grey[500],fontSize: 18),
          children:  [
            TextSpan(text: "  Create",
          style:const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=> SignUpScreen()))
          ]
          )),
        ],),
      ),
      
    );
  }
}