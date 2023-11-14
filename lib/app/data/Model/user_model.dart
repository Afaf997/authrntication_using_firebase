import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String fullname;
  final int age;
  final String place;
  final int phonenumber;

  UserModel(
      {this.id,
      required this.fullname,
      required this.age,
      required this.place,
      required this.phonenumber});

      toJson(){
        return{"Fullname":fullname,"Age":age, "Place":place, "Phone":phonenumber};
      }

      // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>>document){
      //   final data =document.data()!;
      //   return UserModel(
      //     fullname:data["Fullname"], 
      //     age: data["Age"], 
      //     email:data["Email"], 
      //     phonenumber: data["phonenumber"]
      //     );
      // }
}
