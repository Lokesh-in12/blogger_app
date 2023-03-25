import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  String? title;
  bool? posting;
  CategoryCard({super.key, this.title, this.posting});
  final blogsController = Get.find<BlogsController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => posting!
          ? null
          : context.pushNamed(AppRouteConsts.category,
              params: {"category": title.toString()}),
      child: SizedBox(
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
      ),
    );
  }
}
