import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  var students = <Map<String, dynamic>>[].obs;

  void fetchStudents() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('Users').get();
      students.value = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching students: $e');
    }
  }
}