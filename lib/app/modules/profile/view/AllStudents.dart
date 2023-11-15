
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:taskappfirebase/app/modules/profile/controller/profile_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AllstudentDetails extends StatelessWidget {
  AllstudentDetails({Key? key}) : super(key: key);

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
        title: const Text(
          " Users",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 220, top: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/img/sn.jpg",
                    width: 100,
                  ),
                ),
                const SizedBox(height: 10),
                const Column(
                  children: [
                    Text(
                      "Get On Board!",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Obx(()
                   => Column(
                    children: List.generate(
                      studentController.students.length,
                      (index) => Column(
                        children: [
                          Slidable(
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: "Delete",
                                  onPressed: (context) async{
                                  await studentController.deleteStudent(studentController.students[index]['id']);
                                   
                                  },
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                iconColor: Colors.black,
                                tileColor: Colors.white.withOpacity(0.10),
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color.fromARGB(255, 104, 103, 103).withOpacity(0.1)),
                                  child: const Icon(
                                    LineAwesomeIcons.user_1,
                                    color: Color.fromARGB(255, 13, 89, 152),
                                  ),
                                ),
                                title: Text(
                                  studentController.students[index]['name'],
                                  style:const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        studentController.students[index]
                                                ['email']
                                            .toString(),
                                        style:const TextStyle(
                                            height: 1.7,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                    Text(
                                        studentController.students[index]
                                                ['phone']
                                            .toString(),
                                        style: TextStyle(height: 1)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
