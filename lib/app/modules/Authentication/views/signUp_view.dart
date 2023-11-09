import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
   List images =[
     "fb.avif", "google.webp",
   ];

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
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
          width: wt,
          child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,), 
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
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email,color:Colors.black),
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
                    hintText: "Password",
                  prefixIcon: Icon(Icons.password,color:Colors.black),
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
           ],
        ),),
        const SizedBox(height: 70,),
         Container(
          width: wt*0.5,
          height:ht*0.08,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image:const DecorationImage(image:AssetImage("assets/img/by.jpg"),
            fit: BoxFit.cover)
          ),
          child:const Center(child: Text("Sign in ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
        const SizedBox(height:20,),
        RichText(text: TextSpan(text: "Sign up using one of the following methods",
        style: TextStyle(color: Colors.grey[500],fontSize: 16),
        )),
        Wrap(
          children: List<Widget>.generate(
            2, (index) =>  CircleAvatar(
              radius: 25,backgroundImage: AssetImage(
                "assets/img/"+images[index]
              ),
            )),
        )
      ],),
      

    );
  }
}