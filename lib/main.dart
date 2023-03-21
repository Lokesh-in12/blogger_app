import 'package:blogger_app/core/consts/injections/injections.dart';
import 'package:blogger_app/core/routes/app_route_config.dart';
import 'package:blogger_app/firebase_options.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Injections());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authController = Get.find<AuthController>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig:
          MyAppRouterConfig.returnRouter(authController.isLoggedIn.value),
    );
  }
}
