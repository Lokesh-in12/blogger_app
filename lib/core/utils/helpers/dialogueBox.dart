import 'package:blogger_app/core/themes/themes.dart';
import 'package:blogger_app/src/views/screens/createBlogscreen/widgets/categories_list/category_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void DialogueBox(
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
                              backgroundColor: ThemeColor.blackBasic),
                          onPressed: () => context.pop(),
                          child: Text(
                            "Cancel",
                            style: const TextStyle(color: ThemeColor.white),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: ThemeColor.blackBasic),
                          onPressed: () {},
                          child: Text(
                            "Done",
                            style: const TextStyle(color: ThemeColor.white),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ));
}
