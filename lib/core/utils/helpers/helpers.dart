import 'package:blogger_app/core/themes/colors.dart';

import 'package:blogger_app/src/views/screens/createBlogscreen/widgets/categories_list/category_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Helpers {
  // ignore: non_constant_identifier_names
  static void DialogueBox(
    BuildContext ctx,
    String title,
  ) {
    showDialog(
        context: ctx,
        builder: (context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const CategoryChooseList(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.blackBasic),
                            onPressed: () => context.pop(),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: AppColors.white),
                            )),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.blackBasic),
                            onPressed: () => context.pop(),
                            child: const Text(
                              "Done",
                              style: TextStyle(color: AppColors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
