import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  String? title;
  bool? posting;
  CategoryCard({super.key, this.title, this.posting});
  final blogsController = Get.find<BlogsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: posting! ? 120 : 80,
      height: 30,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: const Color.fromARGB(204, 233, 232, 232),
              borderRadius: BorderRadius.circular(8)),
          child: posting!
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(title.toString()),
                      InkWell(
                          onTap: () => blogsController.category.value = "",
                          child: const Icon(Icons.remove))
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    title.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
    );
  }
}
