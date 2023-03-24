import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/core/themes/themes.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/controllers/sign_in_controller/sign_in_controller.dart';
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
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                // ignore: prefer_const_constructors
                Text(
                  "Login to proceed further",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 22)),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 70,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              onChanged: (value) => signInController.checkEmail(
                                  signInController.email.text.trim()),
                              controller: signInController.email,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          signInController.validEmail.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                  // enabledBorder: OutlineInputBorder(
                                  //     borderSide: signInController
                                  //                 .validEmail.value ==
                                  //             true
                                  //         ? const BorderSide(
                                  //             color: Colors.white)
                                  //         : const BorderSide(
                                  //             color: Colors.red)),
                                  label: Text("Email",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 15))),
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
                                      borderSide:
                                          signInController.validPass.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                  // enabledBorder: OutlineInputBorder(
                                  //     borderSide: signInController
                                  //                 .validPass.value ==
                                  //             true
                                  //         ? const BorderSide(
                                  //             color: Colors.white)
                                  //         : const BorderSide(
                                  //             color: Colors.red)),
                                  label: Text("password",
                                      style: GoogleFonts.montserrat(
                                          textStyle:
                                              const TextStyle(fontSize: 15))),
                                  prefixIcon:
                                      const Icon(Icons.fingerprint_outlined)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 51, 51, 51)),
                                onPressed: () async {
                                  if (signInController.validEmail.value &&
                                      signInController.validPass.value) {
                                    authController.LoginUserWithEmailAndPass(
                                        signInController.email.text.trim(),
                                        signInController.password.text.trim(),
                                        context);
                                    await Future.delayed(
                                        const Duration(seconds: 1), () {
                                      signInController.email.clear();
                                      signInController.password.clear();
                                    });
                                    //   .then((data) {
                                    // if (data == false) {
                                    //   print("data=>>> $data");
                                    // } else {
                                    //   signInController.email.clear();
                                    //   signInController.name.clear();
                                    //   signInController.phoneNo.clear();
                                    //   signInController.password.clear();
                                    //   context.pushNamed(AppRouteConsts.home);
                                    // }
                                    // });
                                  }
                                },
                                child: Text(
                                  "Signin",
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          color: ThemeColor.white)),
                                )),
                            TextButton(
                                onPressed: () =>
                                    context.pushNamed(AppRouteConsts.signUp),
                                child: Text(
                                  "Don't have an account? Let's create one!",
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          color: ThemeColor.blackBasic)),
                                )),
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
                                Text(
                                  "Sign In With Google",
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await authController.login();
                                    if (authController.googleAccount.value !=
                                        null) {
                                      context.goNamed(AppRouteConsts.home);
                                    } else {}
                                  },
                                  child: Image.asset(
                                    'assets/images/googleicons.png',
                                    height: 45,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
