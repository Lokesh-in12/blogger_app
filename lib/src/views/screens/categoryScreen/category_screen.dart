import 'package:blogger_app/core/themes/themes.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/views/widgets/blog_card_horiz/blog_card_horiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CategoryScreen extends StatefulWidget {
  String? category;
  CategoryScreen({super.key, this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final blogsController = Get.find<BlogsController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    asyncFunc(widget.category!);
  }

  Future<void> asyncFunc(String category) async {
    await blogsController.fetchSelectedCategory(category);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (blogsController.Category.length == 0) {
        Scaffold(
          body: SafeArea(
              // child: Center(child: Text("No Blogs for ${widget.category}"))),
              child: Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: ThemeColor.blackBasic, size: 40))),
        );
      }
      return Scaffold(
        appBar: AppBar(title: Text(widget.category!)),
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: blogsController.Category.length,
              itemBuilder: (context, index) {
                return BlogCardsHoriz(
                  user: false,
                  e: blogsController.Category[index],
                );
              },
            )
          ],
        ),
      );
    });
  }
}
