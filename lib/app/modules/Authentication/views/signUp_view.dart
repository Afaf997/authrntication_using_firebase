import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/details_user.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/user_details.dart';

// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({super.key});

//   // String imageUrl='';

//   @override
//   Widget build(BuildContext context) {
//    var emailController =TextEditingController();
//    var passwordController =TextEditingController();
//    var usernameController =TextEditingController();
//    var phonenumberController =TextEditingController();

//     double wt= MediaQuery.of(context).size.width;
//     double ht = MediaQuery.of(context).size.height;
//     return  SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//           body: SingleChildScrollView(
//             child: Column(
//             children: [

//             Stack(
//               children: [
//                 const CircleAvatar(
//                 radius: 100,
//                 backgroundImage: AssetImage("assets/img/avathar.jpg"),
//                 ),
//                 // ignore: sort_child_properties_last
//                 // Positioned(child: IconButton(
//                 //   onPressed:()async{
//                 //     ImagePicker imagePicker =ImagePicker();
//                 //    XFile? file=await imagePicker.pickImage(source: ImageSource.camera);
//                 //    print('${file?.path}');

//                 //    String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();

//                 //    //reference
//                 //    Reference referenceRoot=FirebaseStorage.instance.ref();
//                 //    Reference referenceDirImages=referenceRoot.child("images");

//                 //    Reference referenceImageToUpload=referenceDirImages.child(uniqueFileName);

//                 //    try{
//                 //       await referenceImageToUpload.putFile(File(file!.path));
//                 //        imageUrl=await referenceImageToUpload.getDownloadURL();
//                 //    }catch(error){

//                 //    }
//                 //    //store the file

//                 //   },
//                 //   icon: const Icon(Icons.add_a_photo),
//                 // ),top:120,left:120,)
//               ]
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
//               width: wt,
//               child:  Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //...................................................................................
//                 Container(
//                   decoration: BoxDecoration(color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow:  [
//                     BoxShadow(blurRadius: 10,offset: const Offset(1, 1),
//                     spreadRadius: 7,
//                     color: Colors.grey.withOpacity(0.2))
//                   ]),
//                   child: TextFormField(
//                     controller: usernameController,
//                      decoration: InputDecoration(
//                         hintText: "Name",
//                       prefixIcon:const Icon(Icons.person,color:Colors.black),
//                       focusedBorder:  OutlineInputBorder(
//                         borderRadius:BorderRadius.circular(30),
//                         borderSide:const BorderSide(color: Colors.white,width: 1.0)
//                       ),
//                       enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
//                         borderSide:const BorderSide(color: Colors.white,width: 1.0)),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30)
//                       )
//                      ),
//                   ),
//                 ),//........................................................
//                 const SizedBox(height: 20,),
//                 Container(
//                   decoration: BoxDecoration(color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow:  [
//                     BoxShadow(blurRadius: 10,offset: const Offset(1, 1),
//                     spreadRadius: 7,
//                     color: Colors.grey.withOpacity(0.2))
//                   ]),

//                   child: TextFormField(
//                     controller: emailController,
//                      decoration: InputDecoration(
//                       hintText: "Email",
//                       prefixIcon:const Icon(Icons.email,color:Colors.black),
//                       focusedBorder:  OutlineInputBorder(
//                         borderRadius:BorderRadius.circular(30),
//                         borderSide:const BorderSide(color: Colors.white,width: 1.0)
//                       ),
//                       enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
//                         borderSide:const BorderSide(color: Colors.white,width: 1.0)),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30)
//                       )
//                      ),
//                   ),
//                 ),//.......................................................................
//                 const SizedBox(height: 20,),
//                 Container(
//                   decoration: BoxDecoration(color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow:  [
//                     BoxShadow(blurRadius: 10,offset: const Offset(1, 1),
//                     spreadRadius: 7,
//                     color: Colors.grey.withOpacity(0.2))
//                   ]),
//                   child: TextFormField(
//                     controller: passwordController,
//                     obscureText: true,
//                      decoration: InputDecoration(
//                         hintText: "Password",
//                       prefixIcon: Icon(Icons.password,color:Colors.black),
//                       focusedBorder:  OutlineInputBorder(
//                         borderRadius:BorderRadius.circular(30),
//                         borderSide: BorderSide(color: Colors.white,width: 1.0)
//                       ),
//                       enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
//                         borderSide: BorderSide(color: Colors.white,width: 1.0)),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30)
//                       )
//                      ),
//                   ),
//                 ),//........................................................
//                  const SizedBox(height: 20,),
//                 Container(
//                   decoration: BoxDecoration(color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow:  [
//                     BoxShadow(blurRadius: 10,offset: const Offset(1, 1),
//                     spreadRadius: 7,
//                     color: Colors.grey.withOpacity(0.2))
//                   ]),
//                   child: TextFormField(
//                     controller: phonenumberController,
//                      decoration: InputDecoration(
//                         hintText: "Phone number",
//                       prefixIcon: Icon(Icons.phone,color:Colors.black),
//                       focusedBorder:  OutlineInputBorder(
//                         borderRadius:BorderRadius.circular(30),
//                         borderSide: BorderSide(color: Colors.white,width: 1.0)
//                       ),
//                       enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
//                         borderSide: BorderSide(color: Colors.white,width: 1.0)),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30)
//                       )
//                      ),
//                   ),
//                 ),//............
//                ],
//             ),),
//             const SizedBox(height: 70,),
//              GestureDetector(
//               onTap: (){
//                   FocusScope.of(context).unfocus();
//                 AuthController.instance.register(emailController.text, passwordController.text);
//               },
//                child: Container(
//                 width: wt*0.5,
//                 height:ht*0.08,
//                 decoration:  BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   image:const DecorationImage(image:AssetImage("assets/img/by.jpg"),
//                   fit: BoxFit.cover)
//                 ),
//                 child:const Center(child: Text("Sign up ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
//                      ),
//              ),
//             const SizedBox(height:10,),
//                 RichText(text: TextSpan(
//                   recognizer:TapGestureRecognizer()..onTap=()=>Get.back(),
//                   text: "Have an account?",
//             style: TextStyle(color: Colors.grey[500],fontSize: 18),
//             )),
//                  const SizedBox(height: 30,),
//             RichText(text: TextSpan(
//               recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
//               text: "Sign up using one of the following methods",
//             style: TextStyle(color: Colors.grey[500],fontSize: 13),
//             )),
//                 ],),
//           ),

//       ),
//     );
//   }
// }

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key, this.isEditing = false, this.student})
      : super(key: key);

  final UserDeatailsController userdetailsController =
      Get.put(UserDeatailsController());

  String imageUrl = '';
  String selectFileName = '';
  // XFile file;
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
              Stack(children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/img/avathar.jpg"),
                ),
                // ignore: sort_child_properties_last
                Positioned(
                  child: IconButton(
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      print('${file?.path}');

                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      //reference
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                          referenceRoot.child("images");

                      Reference referenceImageToUpload =
                          referenceDirImages.child(uniqueFileName);

                      try {
                        await referenceImageToUpload.putFile(File(file!.path));
                        imageUrl =
                            await referenceImageToUpload.getDownloadURL();
                      } catch (error) {}
                      //store the file
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  top: 120,
                  left: 120,
                )
              ]),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                width: wt,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                spreadRadius: 7,
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.person, color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ), //........................................................
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                spreadRadius: 7,
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ), //.......................................................................
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                spreadRadius: 7,
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon:
                                Icon(Icons.password, color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ), //........................................................
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                spreadRadius: 7,
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextFormField(
                        controller: phonenumberController,
                        decoration: InputDecoration(
                            hintText: "Phone number",
                            prefixIcon: Icon(Icons.phone, color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ), //............
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () async {
                  if (isEditing) {
                    await userdetailsController.updateStudent(student!['id'], {
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
                  userdetailsController.fetchUserDetails();

                   FocusScope.of(context).unfocus();
                  AuthController.instance.register(emailController.text,passwordController.text); 
                },
                // onTap: (){
                //     FocusScope.of(context).unfocus();
                //   AuthController.instance.register(emailController.text, passwordController.text);
                // },
                child: Container(
                  width: wt * 0.5,
                  height: ht * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage("assets/img/by.jpg"),
                          fit: BoxFit.cover)),
                  child: const Center(
                      child: Text(
                    "Sign up ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
