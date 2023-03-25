import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FollowerInfo extends StatelessWidget {
  String? title;
  String? num;
  FollowerInfo({super.key, this.title, this.num});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title.toString(),
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          num.toString(),
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
