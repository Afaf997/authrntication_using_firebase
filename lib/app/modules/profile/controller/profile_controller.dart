import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

// class StudentController extends GetxController {
//   var students = <Map<String, dynamic>>[].obs;
//   var isLoading = false.obs; // Add this line

//   void fetchStudents() async {
//     try {
//       isLoading.value = true; // Set isLoading to true before fetching
//       var snapshot = await FirebaseFirestore.instance.collection('Users').get();
//       students.value = snapshot.docs.map((doc) => doc.data()).toList();
//     } catch (e) {
//       print('Error fetching students: $e');
//     } finally {
//       isLoading.value = false; // Set isLoading to false after fetching
//     }

//   }
// }

class StudentController extends GetxController {
  var students = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  void fetchStudents() async {
    try {
      isLoading.value = true;
      var snapshot = await FirebaseFirestore.instance.collection('Users').get();
      students.value = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Include the document ID
        return data;
      }).toList();
    } catch (e) {
      print('Error fetching students: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteStudent(String studentId) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance.collection('Users').doc(studentId).delete();
      fetchStudents(); // Refresh the list after deletion
    } catch (e) {
      print('Error deleting student: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateStudent(String studentId, Map<String, dynamic> updatedData) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance.collection('Users').doc(studentId).update(updatedData);
      fetchStudents(); // Refresh the list after update
    } catch (e) {
      print('Error updating student: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
