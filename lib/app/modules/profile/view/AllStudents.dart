import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:taskappfirebase/app/modules/profile/controller/profile_controller.dart';

class AllstudentDetails extends StatelessWidget {
  AllstudentDetails({super.key});

  final StudentController studentController = Get.put(StudentController());

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
        elevation: 0,
        backgroundColor: Colors.white,
        title:const Text(" Users",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),),
      ),
      body: Container(     
        padding: EdgeInsets.all(20),  
            
        child: Obx(
          () => ListView.builder(
            itemCount: studentController.students.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                     decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), // Set the border color
                      borderRadius: BorderRadius.circular(8), // Optional: Set border radius
                    ),
                    child: ListTile(
                      iconColor: Colors.black,
                      tileColor: Colors.yellow.withOpacity(0.10),
                      leading: const Icon(LineAwesomeIcons.user_1),
                      title: Text(studentController.students[index]['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(studentController.students[index]['email'].toString()), // Convert to string
                          Text(studentController.students[index]['phone'].toString()), 
                        ],
                      ),
                    ),
                  ),
                          const SizedBox(height: 10), 
                ],
              );
            },
          ),
          
        ),
      ),
    );
  }
}