import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPscreen extends StatelessWidget {
  const OTPscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CODE",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text("verification",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 40,),
            Text("Enter the verification code sent at support@codingwith.com",textAlign:TextAlign.center,),
           const  SizedBox(height:  20,),
           OtpTextField(
            numberOfFields: 6,
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
           ),
           const SizedBox(height: 20,),
           SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: (){}, 
            style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
             ),
            child:Text("Next",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),)),
           )
          ],
        ),
      ),
    );
  }
}