
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/views/screens/createBlogscreen/widgets/categories_list/category_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

Future<void> ShowCustomAlert(BuildContext ctx, String title, String id) async {
  final blogsController = Get.find<BlogsController>();
  showDialog(
    context: ctx,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text("This will remove this blog!"),
      actions: [
        TextButton(
            onPressed: () {
              ctx.pop();
            },
            child: Text("cancel")),
        TextButton(
            onPressed: () async {
              context.pop();
              await blogsController.removeBlog(id);
            },
            child: Text("ok")),
      ],
    ),
  );
}
