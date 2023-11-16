import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskappfirebase/app/modules/profile/controller/location.dart';
import 'package:taskappfirebase/app/modules/profile/controller/profile_controller.dart';

// ignore: must_be_immutable
class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({Key? key, this.isEditing = false, this.student})
      : super(key: key);

  final LocationController locationController =  Get.put<LocationController>(LocationController());
  final StudentController studentController = Get.put(StudentController());

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationControllerr = TextEditingController();

    final bool isEditing;
    final Map<String, dynamic>? student;

  @override
  Widget build(BuildContext context) {
    // Initialize values if editing
    if (isEditing && student != null) {
      nameController.text = student!['name'];
      ageController.text = student!['age'];
      emailController.text = student!['email'];
      phoneController.text = student!['phone'];
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
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
              padding:  EdgeInsets.only(right: 220, top: 40),
              child: SizedBox(
                width: double.infinity,
                height: 110,
                child: Image(
                  image: AssetImage("assets/img/profile.avif"),
                ),
              ),
            ),
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
                      child: Column(
                        children: [
                        const  Stack(
                            children: [],
                          ),
                         const SizedBox(
                            height: 50,
                          ),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    label:const Text("Full Name"),
                                    prefixIcon:
                                      const  Icon(Icons.person_outline_rounded),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide:const BorderSide(
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                               const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: ageController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    label:const Text("Age"),
                                    prefixIcon:const Icon(Icons.numbers),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide:const BorderSide(
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              const  SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    label:const Text("Email"),
                                    prefixIcon:const Icon(Icons.email),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide:const BorderSide(
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                               const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    label:const Text("Phone Number"),
                                    prefixIcon:const Icon(Icons.phone),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide:const BorderSide(
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              const  SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: locationControllerr,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    label:const Text("location"),
                                    prefixIcon:const Icon(Icons.location_on),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide:const BorderSide(
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              const  SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () async {
                                    locationController.getCurrentPosition();
                                  },
                                  child:const SizedBox(
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
                                      ?const CircularProgressIndicator()
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
                                                  "name": nameController.text,
                                                  "age": ageController.text,
                                                  "email": emailController.text,
                                                  "phone": phoneController.text,
                                                });
                                              }
                                              studentController
                                                  .fetchStudents(); // Refresh the list after update or add
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              side: BorderSide.none,
                                              shape:const StadiumBorder(),
                                            ),
                                            child: Text(
                                              isEditing ? "Update" : "Submit",
                                              style:const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              const  SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
