import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blogger_app/core/consts/styles/app_style.dart';

// ignore: must_be_immutable
class UserOptions extends StatelessWidget {
  String? title;
  IconData? icon;
  UserOptions({super.key, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon as IconData?),
            SizedBox(
              width: 10,
            ),
            Text(
              title.toString(),
              style: ThemeText.drawerTitle,
            )
          ],
        ),
        Icon(CupertinoIcons.right_chevron)
      ],
    );
  }
}
