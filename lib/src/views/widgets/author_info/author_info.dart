import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/utils/helpers/time_formatter.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AuthorCardInfo extends StatelessWidget {
  bool? blackTxt;
  // ignore: invalid_annotation_target
  AuthorCardInfo({super.key, @optionalTypeArgs this.blackTxt});
  final blogsController = Get.find<BlogsController>();

  @override
  Widget build(BuildContext context) {
    final singleBlog = blogsController.singleBlog[0];
    return Row(
      children: [
        SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              "https://images.unsplash.com/photo-1661956603025-8310b2e3036d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
              width: 45,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              singleBlog.authorName.toString(),
              style: blackTxt ?? false
                  ? ThemeText.blogText
                  : ThemeText.blogTextBlack,
            ),
            Text(
              getPostTimeFormatted(singleBlog.postTime.toString()),
              style: blackTxt ?? false
                  ? ThemeText.blogText
                  : ThemeText.blogTextBlack,
            ),
          ],
        )
      ],
    );
  }
}
