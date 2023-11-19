import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserDeatailsController extends GetxController {
  var users = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

     User? currentUser=FirebaseAuth.instance.currentUser;

  void fetchUserDetails() async {
  try {
    isLoading.value = true;
    var snapshot = await FirebaseFirestore.instance
        .collection('Users')//changed here 
        .where('userId', isEqualTo: currentUser!.uid)
        .get();
    
    users.value = snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id; 
      return data;
    }).toList();
  } catch (e) {
    print('Error fetching user details: $e');
  } finally {
    isLoading.value = false;
  }
}

  Future<void> deleteStudent(String studentId) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance.collection('User_Details').doc(studentId).delete();
      fetchUserDetails(); 
    } catch (e) {
      print('Error deleting student: $e');
    } finally {
      isLoading.value = false;
    }}
  Future<void> updateStudent(String studentId, Map<String, dynamic> updatedData) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance.collection('User_Details').doc(studentId).update(updatedData);
      fetchUserDetails();
    } catch (e) {
      print('Error updating student: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
