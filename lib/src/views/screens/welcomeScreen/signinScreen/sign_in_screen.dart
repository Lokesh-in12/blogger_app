import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
                  style: const TextStyle(fontSize: 22),
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
                                  label: const Text("Email"),
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
                                  label: const Text("password"),
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
                                onPressed: () {
                                  if (signInController.validEmail.value &&
                                      signInController.validPass.value) {
                                    authController.LoginUserWithEmailAndPass(
                                        signInController.email.text.trim(),
                                        signInController.password.text.trim(),
                                        context);
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
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
                                child: const Text(
                                  "Signin",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )),
                            TextButton(
                                onPressed: () =>
                                    context.pushNamed(AppRouteConsts.signUp),
                                child: const Text(
                                  "Don't have an account? Let's create one!",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                )),
                            const Divider(
                              height: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/googleicons.png',
                                  height: 35,
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
