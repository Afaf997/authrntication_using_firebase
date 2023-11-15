import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:taskappfirebase/app/modules/Authentication/views/login_view.dart';
import 'package:taskappfirebase/app/modules/profile/controller/profile_controller.dart';
import 'package:taskappfirebase/app/modules/profile/view/AllStudents.dart';
import 'package:taskappfirebase/app/modules/profile/view/addStudent.dart';
import 'package:taskappfirebase/app/modules/profile/view/profile_screen.dart';
import 'package:taskappfirebase/app/modules/profile/view/students_update.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  String email;
  WelcomeScreen({super.key, required this.email});
 final StudentController studentController = Get.put(StudentController());

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationControllerr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(children: [
            Container(
              // width: wt,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ]),
          const SizedBox(height: 30,),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                Stack(
                  children: [
                   SizedBox(
                    width: 90,
                    height: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                        child: Image(image: AssetImage("assets/img/image-1.avif"))),
                  ),
                   Positioned(bottom: 0,right: 0,
                  child: Container(width: 35,height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color:const Color.fromARGB(255, 245, 222, 8),),
                  child: const Icon(LineAwesomeIcons.alternate_pencil,color: Colors.black,size: 20,),),
                ),
                  ],), 
                const SizedBox(height: 10,),
                const Text("coding with me",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                SizedBox(width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(()=>const LoginScreen());},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Edit Profile",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
               const SizedBox(height: 30,),
                const Divider(),
                const SizedBox(height: 10),

                 ProfileMenuwidget(title: "dark theme",icon:Icons.dark_mode,onPressed: (){},),
                 ProfileMenuwidget(title: "Add Users",icon: LineAwesomeIcons.wallet,onPressed: (){Get.to(()=> AddStudentScreen());},),
                 ProfileMenuwidget(title: "All Users",icon: LineAwesomeIcons.user_check,onPressed: ()async{ 
                  await FirebaseFirestore.instance.collection("Users").doc().set({
                                        "name": nameController.text,
                                        "age": ageController.text,
                                        "email": emailController.text,
                                        "phone": phoneController.text,
                                      });
                                      studentController.fetchStudents();
                                      Get.to(() => AllstudentDetails());
                  },),
                 ProfileMenuwidget(title: "Students Updation",icon: LineAwesomeIcons.info,onPressed: ()async{ 
                   await FirebaseFirestore.instance.collection("Users").doc().set({
                                        "name": nameController.text,
                                        "age": ageController.text,
                                        "email": emailController.text,
                                        "phone": phoneController.text,
                                      });
                                      studentController.fetchStudents();
                                      Get.to(() => AllstudentDetails());
                  Get.to(()=>StudentDetailsUpdation());},),                 const Divider(color: Colors.grey,),
                 ProfileMenuwidget(title: "Logout",icon: LineAwesomeIcons.alternate_sign_out,onPressed: (){
                   AuthController.instance.logout();
                 },endIcon: false,textcolor: Colors.red,),
 
              ]),
            ),
          )
        ],
      ),
    );
  }
}

