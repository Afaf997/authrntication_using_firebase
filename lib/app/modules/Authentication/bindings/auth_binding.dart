import 'package:get/get.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/details_user.dart';
import 'package:taskappfirebase/app/modules/Authentication/controllers/theme.dart';
import 'package:taskappfirebase/app/modules/profile/controller/location.dart';
import 'package:taskappfirebase/app/modules/profile/controller/profile_controller.dart';

import '../controllers/auth_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthController());
    // Get.put(UserDeatailsController());
    // Get.put(StudentController());
    // Get.put(UserDeatailsController());
    // Get.put(LocationController());
     Get.lazyPut(() => AuthController());
    Get.lazyPut(() => UserDeatailsController());
    Get.lazyPut(() => StudentController());
    Get.lazyPut(() => LocationController());
  }
}
