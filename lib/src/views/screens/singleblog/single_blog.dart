import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SingleBlogPage extends StatelessWidget {
  String? id;
  SingleBlogPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Single blog page"),
    );
  }
}
