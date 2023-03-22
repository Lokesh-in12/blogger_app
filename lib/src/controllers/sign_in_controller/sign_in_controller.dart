import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class SignInController extends GetxController {
  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  RxBool validEmail = false.obs;
  RxBool validPass = false.obs;
  RxBool validUsername = false.obs;
  RxBool validPhoneNo = false.obs;
  RxBool validated = false.obs;

  void checkEmail(String email) {
    bool isValid = EmailValidator.validate(email);
    isValid ? validEmail.value = true : validEmail.value = false;
  }

  void checkPass(String password) {
    print(password.length);
    password.length > 6 ? validPass.value = true : validPass.value = false;
  }

  void checkUsername(String username) {
    username.length > 6
        ? validUsername.value = true
        : validUsername.value = false;
  }

  void checkPhoneNo(String phoneNo) {
    phoneNo.length > 9 ? validPhoneNo.value = true : validPhoneNo.value = false;
  }
}
