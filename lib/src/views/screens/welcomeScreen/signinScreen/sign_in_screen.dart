import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/sign_in_up_controller/sign_in_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final signInAndUpController = Get.find<SignInAndUpController>();
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
                      child: Container(
                        // color: Colors.red,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                onChanged: (value) => signInAndUpController
                                    .checkEmail(signInAndUpController.email.text
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
                                      backgroundColor:
                                          Color.fromARGB(255, 51, 51, 51)),
                                  onPressed: () {
                                    if (signInAndUpController
                                            .validEmail.value &&
                                        signInAndUpController.validPass.value &&
                                        signInAndUpController
                                            .validPhoneNo.value &&
                                        signInAndUpController
                                            .validUsername.value) {
                                      authController.LoginUserWithEmailAndPass(
                                              signInAndUpController.email.text
                                                  .trim(),
                                              signInAndUpController
                                                  .password.text
                                                  .trim())
                                          .then((data) {
                                        if (data == false) {
                                          print("aage nhi ");
                                        } else {
                                          signInAndUpController.email.clear();
                                          signInAndUpController.name.clear();
                                          signInAndUpController.phoneNo.clear();
                                          signInAndUpController.password
                                              .clear();
                                          context
                                              .pushNamed(AppRouteConsts.home);
                                        }
                                      });
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
