import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/details_user.dart';
import 'package:taskappfirebase/app/modules/Authentication/functions/image.dart';
import 'package:taskappfirebase/app/modules/Authentication/views/login_view.dart';
import 'package:taskappfirebase/app/modules/profile/controller/profile_controller.dart';
import 'package:taskappfirebase/app/modules/profile/view/AllStudents.dart';
import 'package:taskappfirebase/app/modules/profile/view/addStudent.dart';
import 'package:taskappfirebase/app/modules/profile/view/profile_screen.dart';
import 'package:taskappfirebase/app/modules/profile/view/students_update.dart';
// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  final String email;
  User? currentUser = FirebaseAuth.instance.currentUser;

  WelcomeScreen({super.key, required this.email});
 final  StudentController studentController =Get.put(StudentController());
 final  UserDeatailsController userController =Get.put(UserDeatailsController());
  // final StudentController studentController = Get.find<StudentController>();
  // final UserDeatailsController userController = Get.find<UserDeatailsController>();
  final ImagePickerService imagePickerService = ImagePickerService(); 

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationControllerr = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
         const SizedBox(height: 30,),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child:Text("Welcome",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black54,),),
              ),
            ],
          ),
const  SizedBox(height: 30, ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          imagePickerService.pickAndUploadImage(email);
                        },
                        child: Stack(
                          children: [
                            SizedBox( width: 90, height: 90,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('User_Details')
                                    .where('email', isEqualTo: email)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const CircleAvatar(radius: 45,backgroundColor: Colors.grey,
                                    );
                                  }
                                  var user =snapshot.data?.docs.isNotEmpty ?? false
                                          ? snapshot.data!.docs[0].data(): null;
                                  var imageUrl =(user as Map<String, dynamic>?)?['image'];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: imageUrl != null? Image.network(imageUrl,width: 90,
                                            height: 90,
                                            fit: BoxFit.cover,
                                          )
                                        :const CircleAvatar(
                                            radius: 45,
                                            backgroundColor: Colors.grey,
                                          ),
                                  );
                                },
                              ),
                            ),
                            Positioned(bottom: 0,right: 0,
                              child: Container(width: 35,decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color.fromARGB(255, 245, 222, 8),
                                ),
                                child: const Icon(
                                  LineAwesomeIcons.camera,
                                  color: Colors.black,
                                  size: 20,)))],),)],
                  ),
                 const SizedBox(height: 10),
                  Text(email,style: TextStyle(  fontSize: 18,  fontWeight: FontWeight.bold,  color: Colors.grey[500],
                    ),
                  ),
                 const SizedBox( height: 20,),
                  SizedBox(width: 200,child: ElevatedButton(onPressed: () {
                        Get.to(() => const LoginScreen());},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text("Edit Profile",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,))),
                  ),
                 const SizedBox(height: 30,),
                 const Divider(),
                 const SizedBox(height: 10),
                  ProfileMenuwidget(
                    title: " Dark Theme",
                    icon: Icons.dark_mode,
                    onPressed: () {
                      // AuthController.instance.toggleDarkTheme();
                    },
                  ),
                  ProfileMenuwidget(
                    title: "Add Students",
                    icon: LineAwesomeIcons.wallet,
                    onPressed: () {
                      Get.to(() => AddStudentScreen());
                    },
                  ),
                  ProfileMenuwidget(
                    title: "All Students",
                    icon: LineAwesomeIcons.user_check,
                    onPressed: () async {
                      studentController.fetchStudents();
                      Get.to(() => AllstudentDetails());
                    },
                  ),
                  ProfileMenuwidget(
                    title: "Students Updation",
                    icon: LineAwesomeIcons.info,
                    onPressed: () async {
                      studentController.fetchStudents();
                      Get.to(() => StudentDetailsUpdation());
                    },
                  ),
                  Divider(color: Colors.grey),
                  ProfileMenuwidget(
                    title: "Logout",
                    icon: LineAwesomeIcons.alternate_sign_out,
                    onPressed: () {
                      AuthController.instance.logout();
                    },
                    endIcon: false,
                    textcolor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
