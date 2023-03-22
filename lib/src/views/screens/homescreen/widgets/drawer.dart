import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final authcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello, Lokesh",
              style: ThemeText.heading2,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                Icon(CupertinoIcons.person),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Your Profile",
                  style: ThemeText.drawerTitle,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Icon(CupertinoIcons.bookmark_fill),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Your Bookmarks",
                  style: ThemeText.drawerTitle,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Icon(CupertinoIcons.settings),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: ThemeText.drawerTitle,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Icon(CupertinoIcons.person_2),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Share this app",
                  style: ThemeText.drawerTitle,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
