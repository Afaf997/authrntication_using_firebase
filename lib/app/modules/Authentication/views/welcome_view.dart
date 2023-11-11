import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:taskappfirebase/app/modules/profile/view/profile_screen.dart';
import 'package:taskappfirebase/app/modules/profile/view/update_profile.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  String email;
  WelcomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Container(
          //   width: wt,
          //   height:ht*0.3,
          //   decoration: const BoxDecoration(
          //     image:DecorationImage(image:AssetImage("assets/img/sn2.jpg"),
          //     fit: BoxFit.cover)
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
          Row(children: [
            Container(
              width: wt,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            //  const  SizedBox(width: 30,),
            GestureDetector(
              onTap: () {
                AuthController.instance.logout();
              },
              child: Container(
                width: wt * 0.3, //5
                height: ht * 0.06, //8
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage("assets/img/by.jpg"),
                        fit: BoxFit.cover)),
                child: const Center(
                    child: Text(
                  "Sign out",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ]),
          const SizedBox(height: 30,),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(image: AssetImage("assets/img/by.jpg"))),
                ),
                const SizedBox(height: 10,),
                const Text("coding with me",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text("superadmin@codingwithme.com"),
                const SizedBox(height: 20,),
                SizedBox(width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(()=>const UpdateProfileScreen());},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 245, 222, 8),
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Edit Profile",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ))),
               const SizedBox(height: 30,),
                const Divider(),
                const SizedBox(height: 10),

                ProfileMenuwidget(title: "Settings",icon: LineAwesomeIcons.cog,onPressed: (){},),
                 ProfileMenuwidget(title: "Details",icon: LineAwesomeIcons.wallet,onPressed: (){},),
                ProfileMenuwidget(title: "User Managment",icon: LineAwesomeIcons.user_check,onPressed: (){},),
               ProfileMenuwidget(title: "Information",icon: LineAwesomeIcons.info,onPressed: (){},),
                         const Divider(color: Colors.grey,),
               ProfileMenuwidget(title: "Logout",icon: LineAwesomeIcons.alternate_sign_out,onPressed: (){},endIcon: false,textcolor: Colors.red,),
              
              ]),
            ),
          )
        ],
      ),
    );
  }
}

