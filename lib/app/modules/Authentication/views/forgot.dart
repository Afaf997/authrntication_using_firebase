import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:taskappfirebase/app/modules/profile/functions/text_field.dart';

class ForgotPssWord extends StatelessWidget {
  ForgotPssWord({super.key});

  final emailforgotcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
        double wt= MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
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
         const Padding(
            padding: EdgeInsets.only(right: 170),
            child: Text("Reset Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
          ),SizedBox(height: 20,),
        buildTextFormField(
          controller: emailforgotcontroller,
          label: "Email",
          prefixIcon: Icons.email,
        ),
        SizedBox(height: 20,),
         Container(
          width: wt*0.5,
          height:ht*0.08,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image:const DecorationImage(image:AssetImage("assets/img/by.jpg"),
            fit: BoxFit.cover)
          ),
          child:const Center(child: Text("Reset Password ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),)),
               ),

          ],
        ),
        
      ),
    );
  }
}
