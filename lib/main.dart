import 'package:blogger_app/core/consts/injections/injections.dart';
import 'package:blogger_app/core/routes/app_route_config.dart';
import 'package:blogger_app/firebase_options.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Injections());
  // final fifteenAgo = DateTime.now().subtract(Duration(
  //   hours: 20,
  //   minutes: 31,
  // ));
  // final ago = timeago.format(fifteenAgo).split(" ")[0];

  var currentTime = DateTime.now();
  var postTime = "t";

  var date = currentTime.toString().split(" ")[0].replaceAll("-", "");

  var prevDate = "20230323";
  print(DateTime.now().difference(DateTime(int.parse(prevDate))));

  var finalTime = currentTime.subtract(
      Duration(days: int.parse(date) - 20230323, hours: 19, minutes: 44));

  print(timeago.format(finalTime, clock: DateTime.now()));

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
      debugShowCheckedModeBanner: false,
      routerConfig:
          MyAppRouterConfig.returnRouter(authController.isLoggedIn.value),
    );
  }
}
