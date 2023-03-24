import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final authcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print("current User is=>>> ${authcontroller.googleAccount.value}");
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authcontroller.auth.currentUser?.email!
                      .split("@")[0]
                      .toString() ??
                  authcontroller.googleAccount.value?.displayName.toString() ??
                  "",
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
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () async {
                if (authcontroller.googleAccount.value == null) {
                  await authcontroller.logOutEmail(context);
                } else {
                  await authcontroller.googleLogout();
                }
                // ignore: use_build_context_synchronously
                context.goNamed(AppRouteConsts.signIn);
              },
              child: Row(
                children: const [
                  Icon(Icons.login_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Logout",
                    style: ThemeText.drawerTitle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
