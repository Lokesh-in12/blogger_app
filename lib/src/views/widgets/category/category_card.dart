import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 70,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Color.fromARGB(204, 233, 232, 232), borderRadius: BorderRadius.circular(8)),
            child: const Center(
              child: Text("Adventure"),
            ),
          ),
        );
  }
}
