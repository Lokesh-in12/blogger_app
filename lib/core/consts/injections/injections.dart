import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:blogger_app/src/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:get/get.dart';

class Injections {
  AuthController authController = Get.put(AuthController());
  SignUpController signUpController = Get.put(SignUpController());
  SignInController signInController = Get.put(SignInController());
}
