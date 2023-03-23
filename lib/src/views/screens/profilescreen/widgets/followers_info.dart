import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style:
              GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 20)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          num.toString(),
          style:
              GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
