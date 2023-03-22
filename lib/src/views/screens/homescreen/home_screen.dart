import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final authcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print("the user is=>> ${authcontroller.firebaseUser}");
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: const [
                Icon(CupertinoIcons.search),
                SizedBox(
                  width: 20,
                ),
                Icon(CupertinoIcons.profile_circled)
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("data"),
              TextButton.icon(
                  onPressed: () {
                    authcontroller.logOut();
                    context.goNamed(AppRouteConsts.signIn);
                  },
                  icon: Icon(Icons.logout),
                  label: Text(""))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Column(
              children: [Text('Blogs for you',)],
            ),
          )
        ],
      ),
    );
  }
}
