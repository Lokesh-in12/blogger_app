import 'package:flutter/material.dart';

class SmCategoryCard extends StatelessWidget {
  const SmCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 20,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Color.fromARGB(178, 231, 231, 231),
            borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Text(
            "Adventure",
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
