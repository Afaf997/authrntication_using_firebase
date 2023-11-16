import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final int phonenumber;
  final String password;

  UserModel(
      {this.id,
      required this.fullname,
      required this.password,
      required this.email,
      required this.phonenumber});

      toJson(){
        return{"Fullname":fullname,"Password":password, "Email":email, "Phone":phonenumber};
      }
}
