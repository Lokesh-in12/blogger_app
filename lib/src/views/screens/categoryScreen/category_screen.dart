import 'package:blogger_app/core/themes/colors.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/views/widgets/blog_card_horiz/blog_card_horiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatefulWidget {
  String? category;
  CategoryScreen({super.key, this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final blogsController = Get.find<BlogsController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    asyncFunc(widget.category!);
  }

  Future<void> asyncFunc(String category) async {
    await blogsController.fetchSelectedCategory(category);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (blogsController.Category.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.category!),
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.blackBasic,
            elevation: 0.0,
          ),
          body: SafeArea(
              child: Center(child: Text("No Blogs for ${widget.category}"))),
        );
      }
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text(widget.category!),
          foregroundColor: AppColors.blackBasic,
          backgroundColor: AppColors.white,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
          ),
        ),
      );
    });
  }
}
