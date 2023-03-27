import 'package:blogger_app/core/themes/colors.dart';

import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChoiceChip extends StatelessWidget {
  String? category;
  CategoryChoiceChip({super.key, this.category});
  final blogsController = Get.find<BlogsController>();

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: AppColors.selectedColor,
      backgroundColor: AppColors.lightGrey,
      label: Text(
        category.toString(),
        style: const TextStyle(fontSize: 15),
      ),
      selected: false,
      onSelected: (value) {
        blogsController.setCategory(category);
        context.pop();
      },
    );
  }
}
