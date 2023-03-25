import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/core/themes/themes.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final signInController = Get.find<SignInController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    "Login ",
                    style: TextStyle(fontSize: 30),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/login.png',
                    height: 190,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            onChanged: (value) => signInController
                                .checkEmail(signInController.email.text.trim()),
                            controller: signInController.email,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: signInController
                                                .validEmail.value ==
                                            true
                                        ? const BorderSide(color: Colors.white)
                                        : const BorderSide(color: Colors.red)),
                                label: const Text("Email",
                                    style: TextStyle(fontSize: 15)),
                                prefixIcon: const Icon(Icons.email_outlined)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: true,
                            onChanged: (value) => signInController.checkPass(
                                signInController.password.text.trim()),
                            controller: signInController.password,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: signInController
                                                .validPass.value ==
                                            true
                                        ? const BorderSide(color: Colors.white)
                                        : const BorderSide(color: Colors.red)),
                                label: const Text("password",
                                    style: TextStyle(fontSize: 15)),
                                prefixIcon:
                                    const Icon(Icons.fingerprint_outlined)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: ThemeColor.blackBasic),
                            onPressed: () async {
                              if (signInController.validEmail.value &&
                                  signInController.validPass.value) {
                                authController.LoginUserWithEmailAndPass(
                                    signInController.email.text.trim(),
                                    signInController.password.text.trim(),
                                    context);
                                await Future.delayed(const Duration(seconds: 1),
                                    () {
                                  signInController.email.clear();
                                  signInController.password.clear();
                                });
                              }
                            },
                            child: const Text("Signin",
                                style: TextStyle(
                                    fontSize: 17, color: ThemeColor.white)),
                          ),
                          TextButton(
                            onPressed: () =>
                                context.pushNamed(AppRouteConsts.signUp),
                            child: const Text(
                                "Don't have an account? Let's create one!",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: ThemeColor.blackBasic)),
                          ),
                          const Divider(
                            height: 20,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Sign In With Google",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  await authController.googleLoin();
                                  if (authController.googleAccount.value !=
                                      null) {
                                    // ignore: use_build_context_synchronously
                                    context.goNamed(AppRouteConsts.home);
                                  } else {}
                                },
                                child: Image.asset(
                                  'assets/images/googleicons.png',
                                  height: 40,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
