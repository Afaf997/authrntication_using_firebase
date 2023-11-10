import 'package:flutter/material.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/auth_controller.dart';

class WelcomeScreen extends StatelessWidget {
  String email;
   WelcomeScreen({Key?key,required this.email}): super(key: key);

  @override
  Widget build(BuildContext context) {
    double wt= MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return  Scaffold( 
      backgroundColor: Colors.white,
        body: Column(
        children: [ 
        Container(
          width: wt,
          height:ht*0.3,
          decoration: const BoxDecoration(
            image:DecorationImage(image:AssetImage("assets/img/sn2.jpg"),
            fit: BoxFit.cover)
          ),
        ),
        const SizedBox(height: 80,),
        Container(
          width: wt,
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  Text("Welcome",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color:Colors.black54 ),),
            Text(email,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.grey[500] ),),
            ],
          ),
        ),
    
     const  SizedBox(height: 200,),
         GestureDetector(
          onTap: (){
            AuthController.instance.logout();
          },
           child: Container(
            width: wt*0.5,
            height:ht*0.08,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image:const DecorationImage(image:AssetImage("assets/img/by.jpg"),
              fit: BoxFit.cover)
            ),
            child:const Center(child: Text("Sign out",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
         ),
    ],
    ));
      

  

  }
}