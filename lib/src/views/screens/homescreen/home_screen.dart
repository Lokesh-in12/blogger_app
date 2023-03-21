import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final authcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print("the user is=>> ${authcontroller.firebaseUser}");
    return Center(
      child: Text("Homescreen"),
    );
  }
}
