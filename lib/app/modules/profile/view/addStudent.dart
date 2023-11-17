import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskappfirebase/app/modules/profile/controller/location.dart';
import 'package:taskappfirebase/app/modules/profile/controller/profile_controller.dart';
import 'package:taskappfirebase/app/modules/profile/functions/text_field.dart';

// ignore: must_be_immutable
class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({super.key, this.isEditing = false, this.student});

  // final LocationController locationController=Get.find<LocationController>();
   final  StudentController studentController =Get.put(StudentController());
  final  LocationController locationController =Get.put(LocationController());
   
  // final StudentController studentController = Get.find<StudentController>();
  User? currentUser = FirebaseAuth.instance.currentUser;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationControllerr = TextEditingController();

  final bool isEditing;
  final Map<String, dynamic>? student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(icon: const Icon(  Icons.arrow_back,  color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 220, top: 40),
              child: SizedBox(width: double.infinity,height: 110,child: Image(
                  image: AssetImage("assets/img/profile.avif"))),),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    "Get On Board!",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  "Create student details to start your journey",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
            GetBuilder<LocationController>(builder: (controller) {
              locationControllerr.text =
                  locationController.currentAddress.toString();
              return Form(
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(children:[const SizedBox(height: 50),
                          Form(
                            child: Column(
                              children: [
                                buildTextFormField(
                                  controller: nameController,
                                  label: "Full Name",
                                  prefixIcon: Icons.person_outline_rounded,
                                ),
                                buildTextFormField(
                                  controller: ageController,
                                  label: "Age",
                                  prefixIcon: Icons.numbers,
                                ),
                                buildTextFormField(
                                  controller: emailController,
                                  label: "Email",
                                  prefixIcon: Icons.email,
                                ),
                                buildTextFormField(
                                  controller: phoneController,
                                  label: "Phone Number",
                                  prefixIcon: Icons.phone,
                                ),
                                buildTextFormField(
                                  controller: locationControllerr,
                                  label: "Location",
                                  prefixIcon: Icons.location_on,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () async {
                                    locationController.getCurrentPosition();
                                  },
                                  child: const SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/img/location1.png"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(
                                  () => controller.isLoading.value
                                      ? const CircularProgressIndicator()
                                      : SizedBox(
                                          height: 40,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (isEditing) {
                                                await studentController
                                                    .updateStudent(
                                                        student!['id'], {
                                                  "name": nameController.text,
                                                  "age": ageController.text,
                                                  "email": emailController.text,
                                                  "phone": phoneController.text,
                                                });
                                              } else {
                                                await FirebaseFirestore.instance
                                                    .collection("Users")
                                                    .add({
                                                  "createdAt": DateTime.now(),
                                                  "userId": currentUser!.uid,
                                                  "name": nameController.text,
                                                  "age": ageController.text,
                                                  "email": emailController.text,
                                                  "phone": phoneController.text,
                                                });
                                              }
                                              studentController.fetchStudents();
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              side: BorderSide.none,
                                              shape: const StadiumBorder(),
                                            ),
                                            child: Text(
                                              isEditing ? "Update" : "Submit",
                                              style: const TextStyle(
                                                color: Colors.white,fontSize: 18,)),
                                          ),
                                        ),
                                ),
                            const SizedBox(height: 20)],
                        ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );}),
       ],),
      ),
    );
  }
}
