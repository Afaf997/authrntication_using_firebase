import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginScreen extends GetView<HomeController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double wt= MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
            const SizedBox(height: 50,), 
            Container(
              decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow:  [
                BoxShadow(blurRadius: 10,offset: const Offset(1, 1),
                spreadRadius: 7,
                color: Colors.grey.withOpacity(0.2))
              ]),
              child: TextFormField(
                 decoration: InputDecoration(
                  focusedBorder:  OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white,width: 1.0)
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white,width: 1.0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                 ),
              ),
            ),//.......................................................................
            const SizedBox(height: 20,), 
            Container(
              decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow:  [
                BoxShadow(blurRadius: 10,offset: const Offset(1, 1),
                spreadRadius: 7,
                color: Colors.grey.withOpacity(0.2))
              ]),
              child: TextFormField(
                 decoration: InputDecoration(
                  focusedBorder:  OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white,width: 1.0)
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white,width: 1.0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                 ),
              ),
            ),//........................................................
           SizedBox(height: 20,),
           Row(
            children: [
              Expanded(child: Container()),
               Text("Forgot your account?",style: TextStyle(fontSize: 18,color: Colors.grey[500]),),
            ],)
           ],
        ),),
        SizedBox(height: 70,),
         Container(
          width: wt*0.5,
          height:ht*0.08,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image:const DecorationImage(image:AssetImage("assets/img/by.jpg"),
            fit: BoxFit.cover)
          ),
          child:Center(child: const Text("Sign in ",style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
        SizedBox(height:20,),
        RichText(text: TextSpan(text: "Don't have an account?",
        style: TextStyle(color: Colors.grey[500],fontSize: 18),
        children: const [
          TextSpan(text: "  Create",
        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
        ]
        ))
      ],),
      
    );
  }
}
