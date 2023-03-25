import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/themes/themes.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/views/widgets/author_info/author_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:blogger_app/src/views/widgets/category/sm_category_card.dart';

// ignore: must_be_immutable
class SingleBlogPage extends StatefulWidget {
  String? id;
  SingleBlogPage({super.key, this.id});

  @override
  State<SingleBlogPage> createState() => _SingleBlogPageState();
}

class _SingleBlogPageState extends State<SingleBlogPage> {
  final blogsController = Get.find<BlogsController>();

  @override
  void initState() {
    super.initState();
    asyncFunction(widget.id!);
  }

  Future<void> asyncFunction(id) async {
    await blogsController.handleSingleBlog(id);
  }

  @override
  Widget build(BuildContext context) {
    // final singleBlog =
    //     blogsController.AllBlogs.firstWhere((e) => e.id == widget.id);
    final singleBlog = blogsController.singleBlog[0];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: singleBlog.images != null
                      ? Image.network(
                          filterQuality: FilterQuality.low,
                          "${singleBlog.images}",
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          "https://images.unsplash.com/photo-1679458118229-6ac5b35757d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80",
                          fit: BoxFit.cover,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton.icon(
                              style: TextButton.styleFrom(),
                              onPressed: () => context.pop(),
                              icon: const Icon(
                                CupertinoIcons.back,
                                size: 40,
                                color: ThemeColor.white,
                              ),
                              label: const Text("")),
                        ),
                        SizedBox(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmCategoryCard(title: singleBlog.category),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                singleBlog.title.toString(),
                                style: ThemeText.singleBlogHeading,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AuthorCardInfo(),
                          const Icon(CupertinoIcons.bookmark)
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          singleBlog.desc.toString(),
                          style: ThemeText.blogDescStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
