import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskappfirebase/app/modules/profile/controller/location.dart';
import 'package:taskappfirebase/app/modules/profile/controller/profile_controller.dart';
import 'package:taskappfirebase/app/modules/profile/view/AllStudents.dart';

// ignore: must_be_immutable
class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({super.key});

  final LocationController locationController =
      Get.put<LocationController>(LocationController());
  final StudentController studentController = Get.put(StudentController());

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationControllerr = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 220, top: 40),
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
                // key: _formKey,
                child: SingleChildScrollView(
                    child: Center(
                  child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(children: [
                        const Stack(
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
                                  label: Text("Full Name"),
                                  prefixIcon:
                                      Icon(Icons.person_outline_rounded),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black))),
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
                                  label: const Text("Age"),
                                  prefixIcon: Icon(Icons.numbers),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black))),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  label: const Text("Email"),
                                  prefixIcon: const Icon(Icons.email),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black))),
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
                                  label: const Text("Phone Number"),
                                  prefixIcon: const Icon(Icons.phone),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: locationControllerr,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  label: Text("location"),
                                  prefixIcon: const Icon(Icons.location_on),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black))),
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
                                  image: AssetImage("assets/img/location1.png"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(()=>
                             controller.isLoading.value
                          ?const CircularProgressIndicator()
                              : SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection("Users")
                                          .doc()
                                          .set({
                                        "name": nameController.text,
                                        "age": ageController.text,
                                        "email": emailController.text,
                                        "phone": phoneController.text,
                                      });
                                      studentController.fetchStudents();
                                      Get.to(() => AllstudentDetails());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        side: BorderSide.none,
                                        shape: StadiumBorder()),
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ))
                      ])),
                )),
              );
            }),
          ],
        ),
      ),
    );
  }
}
