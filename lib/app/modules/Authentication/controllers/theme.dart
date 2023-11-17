import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class ThemeController extends GetxController {
//   RxBool isDarkTheme = false.obs;

//   void toggleTheme() {
//     isDarkTheme.toggle();
//     Get.changeThemeMode(
//       isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
//     );
//   }
// }
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }
}
