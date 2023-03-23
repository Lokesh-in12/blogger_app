import 'package:blogger_app/core/utils/helpers/dialogueBox.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/views/screens/createBlogscreen/widgets/categories_list/category_list.dart';
import 'package:blogger_app/src/views/screens/createBlogscreen/widgets/choice_chip.dart';
import 'package:blogger_app/src/views/widgets/category/category_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

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
    blogsController.removeUploadedImg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: AppBar(
        backgroundColor: ThemeColor.white,
        foregroundColor: ThemeColor.blackBasic,
        elevation: 0.0,
        title: const Text("Create blog"),
        actions: [
          TextButton(
              onPressed: () {
                blogsController.postBlog(context);
              },
              child: Text(
                "Post",
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 20, color: ThemeColor.blackBasic)),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            color: ThemeColor.white,
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
                                color: const Color.fromARGB(206, 34, 34, 34))),
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
                              onTap: () => blogsController.removeUploadedImg(),
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
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                            fontSize: 22,
                          )),
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
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                            fontSize: 22,
                          )),
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
                            backgroundColor: ThemeColor.blackBasic),
                        onPressed: () {
                          DialogueBox(context, "Select Category");
                        },
                        child: const Text(
                          "Choose Category",
                          style: TextStyle(color: ThemeColor.white),
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
        backgroundColor: ThemeColor.blackBasic,
        onPressed: () {},
        child: const Icon(Icons.wb_incandescent_sharp),
      ),
    );
  }
}
