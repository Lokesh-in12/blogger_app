import 'package:flutter/material.dart';

class SmCategoryCard extends StatelessWidget {
  String? title;
  SmCategoryCard({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Color.fromARGB(178, 231, 231, 231),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
