import 'package:get/get.dart';
import '../modules/Authentication/bindings/auth_binding.dart';
import '../modules/Authentication/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const LoginScreen(),
      binding: HomeBinding(),
    ),
  ];
}
