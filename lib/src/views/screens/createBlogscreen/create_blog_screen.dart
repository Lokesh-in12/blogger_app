import 'package:blogger_app/core/themes/colors.dart';
import 'package:blogger_app/core/utils/helpers/dialogueBox.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/views/widgets/category/category_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class CreateBlogScreen extends StatefulWidget {
  String? id;
  CreateBlogScreen({super.key, this.id});

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final blogsController = Get.find<BlogsController>();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    blogsController.title.clear();
    blogsController.desc.clear();
    blogsController.category.value = "";
    blogsController.removeUploadedImg();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (blogsController.isLoading.value) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColors.blackBasic, size: 40),
          ),
        );
      }
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.blackBasic,
          elevation: 0.0,
          title: const Text("Create blog"),
          actions: [
            TextButton(
                onPressed: () async {
                  blogsController.postBlog(
                      context, _formKey.currentState!.validate());
                },
                child: Text(
                  "Post",
                  style: const TextStyle(
                      fontSize: 20, color: AppColors.blackBasic),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              color: AppColors.white,
              child: Column(
                children: [
                  Obx(() {
                    if (blogsController.imgFile.value.path.isEmpty) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(206, 34, 34, 34))),
                          child: InkWell(
                              onTap: () {
                                blogsController.pickImage();
                              },
                              child: const Icon(CupertinoIcons.photo)),
                        ),
                      );
                    }
                    return SizedBox(
                      // color: Colors.amber,
                      width: 400,
                      height: 250,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.file(
                            blogsController.imgFile.value,
                            fit: BoxFit.contain,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () =>
                                    blogsController.removeUploadedImg(),
                                child: const Icon(CupertinoIcons.clear)),
                          )
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: blogsController.title,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 20,
                            maxLength: 100,
                            maxLengthEnforcement: MaxLengthEnforcement
                                .truncateAfterCompositionEnds,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            decoration: const InputDecoration(
                              hintText: "+ Title for blog...",
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 92, 91, 91))),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: blogsController.desc,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 20,
                            maxLengthEnforcement: MaxLengthEnforcement
                                .truncateAfterCompositionEnds,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            decoration: const InputDecoration(
                              hintText: "+ Description...",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 92, 91, 91)),
                              ),
                            ),
                          )
                        ],
                      )),

                  //category
                  const SizedBox(
                    height: 20,
                  ),

                  Obx(() {
                    if (blogsController.category.value!.isEmpty) {
                      return TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.blackBasic),
                          onPressed: () {
                            DialogueBox(context, "Select Category");
                          },
                          child: const Text(
                            "Choose Category",
                            style: TextStyle(color: AppColors.white),
                          ));
                    }
                    return CategoryCard(
                      title: blogsController.category.value,
                      posting: true,
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),

                  // CategoryChooseList()
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blackBasic,
          onPressed: () {},
          child: const Icon(Icons.wb_incandescent_sharp),
        ),
      );
    });
  }
}
