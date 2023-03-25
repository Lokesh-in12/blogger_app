import 'dart:io';

import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/models/blog_model/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nanoid/async.dart';
import 'package:intl/intl.dart';

class BlogsController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final _auth = FirebaseAuth.instance;
  final authController = Get.find<AuthController>();
  Rx<bool> isLoading = false.obs;

  final imgFile = File('').obs;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  Rx<String?> category = "".obs;

  final Reference storageReference =
      FirebaseStorage.instance.ref().child('Blogs_Images');
  final _dbRef = FirebaseFirestore.instance;

  //Variables for storing blogs
  // ignore: non_constant_identifier_names
  final AllBlogs = <BlogModel>[].obs;

  //users blogs
  final usersBlog = <BlogModel>[].obs;

  //singleBlog
  final singleBlog = <BlogModel>[].obs;

  final Category = <BlogModel>[].obs;

  Future<void> fetchSelectedCategory(String category) async {
    Category.value =
        AllBlogs.where((element) => element.category == category).toList();
  }

  Future<void> handleSingleBlog(String id) async {
    singleBlog.value = AllBlogs.where((element) => element.id == id).toList();
  }

  Future<void> fetchAllBlogs() async {
    try {
      QuerySnapshot<Map<String, dynamic>> res =
          await _dbRef.collection("blogs").get();
      List listData = res.docs;

      List<BlogModel> allBlogss =
          listData.map((e) => BlogModel.fromJson(e)).toList();
      AllBlogs.value = allBlogss;
    } catch (e) {
      if (kDebugMode) {
        print("error in fetchAllBlogs ==> $e");
      }
    }
  }

  Future<void> getUsersBlog() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_auth.currentUser?.uid != null) {
        usersBlog.value = AllBlogs.where(
            (element) => element.authorId == _auth.currentUser!.uid).toList();
      } else {
        usersBlog.value = AllBlogs.where((element) =>
                element.authorId == authController.googleAccount.value!.id)
            .toList();
      }
    });
  }

  void setCategory(val) {
    category.value = val;
  }

  void uplodadTask() {
    print("in uplodadTask");
  }

  void postBlog(BuildContext ctx) async {
    isLoading(true);
    String uniqueId = await nanoid(7);

    String uniqueImageName = DateTime.now().millisecondsSinceEpoch.toString();

    final UploadTask uploadTask =
        storageReference.child(uniqueImageName).putFile(imgFile.value);
    await uploadTask.then((TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((imgUrl) async {
        await saveBlogToFireStore(
            BlogModel(
                authorId: _auth.currentUser?.uid ??
                    authController.googleAccount.value!.id,
                authorName: _auth.currentUser?.email!
                        .split("@")[0]
                        .toString() ??
                    authController.googleAccount.value!.displayName.toString(),
                category: category.toString(),
                images: imgUrl.toString(),
                title: title.text.trim().toString(),
                desc: desc.text.trim().toString(),
                postTime: DateTime.now().toString(),
                postDate: DateTime.now().toLocal().toString(),
                id: uniqueId),
            uniqueId);
        isLoading(false);
        ctx.goNamed(AppRouteConsts.profile, params: {
          "id": _auth.currentUser?.uid.toString() ??
              authController.googleAccount.value!.id
        });
      });
    });
  }

  void removeUploadedImg() {
    imgFile.value = File("");
  }

  Future<void> saveBlogToFireStore(BlogModel blogModel, String uniqueId) async {
    await _dbRef.collection("blogs").doc(uniqueId).set(blogModel.toJson());
  }

  Future<void> pickImage() async {
    try {
      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value != null) {
          if (kDebugMode) {
            print("value of in try  =>>  $value");
          }
          imgFile.value = File(value.path);
        }
      });
    } catch (e) {
      print("error in pickImg catch =>>> $e");
    }
  }
}
