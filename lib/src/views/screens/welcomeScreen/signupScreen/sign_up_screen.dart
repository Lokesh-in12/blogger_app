import 'package:bcrypt/bcrypt.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/sign_in_up_controller/sign_in_up_controller.dart';
import 'package:blogger_app/src/models/UserModel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final signInAndUpController = Get.find<SignInAndUpController>();
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
                                      signInAndUpController.checkUsername(
                                          signInAndUpController.name.text
                                              .trim()),
                                  controller: signInAndUpController.name,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: signInAndUpController
                                                      .validUsername.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderSide: signInAndUpController
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
                                      signInAndUpController.checkEmail(
                                          signInAndUpController.email.text
                                              .trim()),
                                  controller: signInAndUpController.email,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: signInAndUpController
                                                      .validEmail.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderSide: signInAndUpController
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
                                      signInAndUpController.checkPhoneNo(
                                          signInAndUpController.phoneNo.text
                                              .trim()),
                                  controller: signInAndUpController.phoneNo,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: signInAndUpController
                                                      .validPhoneNo.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderSide: signInAndUpController
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
                                  onChanged: (value) =>
                                      signInAndUpController.checkPass(
                                          signInAndUpController.password.text
                                              .trim()),
                                  controller: signInAndUpController.password,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: signInAndUpController
                                                      .validPass.value ==
                                                  true
                                              ? const BorderSide(
                                                  color: Colors.white)
                                              : const BorderSide(
                                                  color: Colors.red)),
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderSide: signInAndUpController
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
                                    onPressed: () {
                                      if (signInAndUpController
                                              .validEmail.value &&
                                          signInAndUpController
                                              .validPass.value &&
                                          signInAndUpController
                                              .validPhoneNo.value &&
                                          signInAndUpController
                                              .validUsername.value) {
                                        final hashedPass = BCrypt.hashpw(
                                            "${signInAndUpController.password.text.trim()}",
                                            BCrypt.gensalt());
                                        authController
                                            .createUserWithEmailAndPass(
                                          signInAndUpController.email.text
                                              .trim(),
                                          signInAndUpController.password.text
                                              .trim(),
                                          UserModel(
                                              email: signInAndUpController
                                                  .email.text
                                                  .trim(),
                                              username: signInAndUpController
                                                  .name.text
                                                  .trim(),
                                              phoneNo: signInAndUpController
                                                  .phoneNo.text
                                                  .trim(),
                                              hashPass: hashedPass),
                                        )
                                            .then((data) {
                                          if (data == null) {
                                            print("aage nhi ");
                                          } else {
                                            signInAndUpController.email.clear();
                                            signInAndUpController.name.clear();
                                            signInAndUpController.phoneNo
                                                .clear();
                                            signInAndUpController.password
                                                .clear();
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
