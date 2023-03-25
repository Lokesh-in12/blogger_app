import 'package:blogger_app/core/consts/injections/injections.dart';
import 'package:blogger_app/core/routes/app_route_config.dart';
import 'package:blogger_app/firebase_options.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blogger_app/core/utils/helpers/scroll_web.dart';

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
      scrollBehavior: MyCustomScrollBehaviour(),
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: MyAppRouterConfig.returnRouter(
        authController.isLoggedIn.value,
      ),
    );
  }
}
