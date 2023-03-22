import 'package:bcrypt/bcrypt.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:blogger_app/src/models/UserModel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nanoid/async.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final signUpController = Get.find<SignUpController>();
  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Let's Create Your Account!",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 0),
                        child: Container(
                          // color: Colors.red,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  onChanged: (value) =>
                                      signUpController.checkUsername(
                                          signUpController.name.text.trim()),
                                  controller: signUpController.name,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: signUpController
                                                      .validUsername.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderSide: signUpController
                                      //                 .validUsername.value ==
                                      //             true
                                      //         ? const BorderSide(
                                      //             color: Colors.white)
                                      //         : const BorderSide(
                                      //             color: Colors.red)),
                                      label: Text("Username"),
                                      prefixIcon:
                                          Icon(Icons.person_2_outlined)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  onChanged: (value) =>
                                      signUpController.checkEmail(
                                          signUpController.email.text.trim()),
                                  controller: signUpController.email,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: signUpController
                                                      .validEmail.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderSide: signUpController
                                      //                 .validEmail.value ==
                                      //             true
                                      //         ? const BorderSide(
                                      //             color: Colors.white)
                                      //         : const BorderSide(
                                      //             color: Colors.red)),
                                      label: Text("Email"),
                                      prefixIcon: Icon(Icons.email_outlined)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  onChanged: (value) =>
                                      signUpController.checkPhoneNo(
                                          signUpController.phoneNo.text.trim()),
                                  controller: signUpController.phoneNo,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: signUpController
                                                      .validPhoneNo.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderSide: signUpController
                                      //                 .validPhoneNo.value ==
                                      //             true
                                      //         ? const BorderSide(
                                      //             color: Colors.white)
                                      //         : const BorderSide(
                                      //             color: Colors.red)),
                                      label: Text("phone no"),
                                      prefixIcon:
                                          Icon(Icons.phone_android_rounded)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  onChanged: (value) => signUpController
                                      .checkPass(signUpController.password.text
                                          .trim()),
                                  controller: signUpController.password,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: signUpController
                                                      .validPass.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderSide: signUpController
                                      //                 .validPass.value ==
                                      //             true
                                      //         ? const BorderSide(
                                      //             color: Colors.white)
                                      //         : const BorderSide(
                                      //             color: Colors.red)),
                                      label: Text("password"),
                                      prefixIcon:
                                          Icon(Icons.fingerprint_outlined)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black),
                                    onPressed: () async {
                                      if (signUpController.validEmail.value &&
                                          signUpController.validPass.value &&
                                          signUpController.validPhoneNo.value &&
                                          signUpController
                                              .validUsername.value) {
                                        final uniqueId = await nanoid(12);
                                        final hashedPass = BCrypt.hashpw(
                                            "${signUpController.password.text.trim()}",
                                            BCrypt.gensalt());
                                        authController
                                            .createUserWithEmailAndPass(
                                          signUpController.email.text.trim(),
                                          signUpController.password.text.trim(),
                                          UserModel(
                                              email: signUpController.email.text
                                                  .trim(),
                                              username: signUpController
                                                  .name.text
                                                  .trim(),
                                              phoneNo: signUpController
                                                  .phoneNo.text
                                                  .trim(),
                                              hashPass: hashedPass,
                                              id: uniqueId),
                                          uniqueId,
                                        )
                                            .then((data) {
                                          if (data == null) {
                                            print("aage nhi ");
                                          } else {
                                            signUpController.email.clear();
                                            signUpController.name.clear();
                                            signUpController.phoneNo.clear();
                                            signUpController.password.clear();
                                            context.pushNamed(
                                                AppRouteConsts.signIn);
                                          }
                                        });
                                      }
                                    },
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    )),
                                TextButton(
                                    onPressed: () => context
                                        .pushNamed(AppRouteConsts.signIn),
                                    child: Text(
                                      "Already have an account?",
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
                                Text("Signin with Google",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 20,
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
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
