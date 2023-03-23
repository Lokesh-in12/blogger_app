import 'dart:io';

import 'package:blogger_app/core/routes/app_route_constants.dart';
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

  final imgFile = File('').obs;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  Rx<String?> category = "".obs;

  final Reference storageReference =
      FirebaseStorage.instance.ref().child('Blogs_Images');

  void setCategory(val) {
    category.value = val;
  }

  // void handleMultipleImages(images) {
  //   for (var i = 0; i < images.length; i++) {
  //     // ImageFile imageFile = images[i];
  //     File file = File("${images[i]}");
  //     print(file.runtimeType);
  //     uplodadTask(file);
  //   }
  // }

  void uplodadTask() {
    print("in uplodadTask");
  }

  final _dbRef = FirebaseFirestore.instance;

  void postBlog(BuildContext ctx) async {
    String uniqueId = await nanoid(7);

    String uniqueImageName = DateTime.now().millisecondsSinceEpoch.toString();

    final UploadTask uploadTask =
        storageReference.child(uniqueImageName).putFile(imgFile.value);
    uploadTask.then((TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((imgUrl) {
        saveBlogToFireStore(
            BlogModel(
                authorId: _auth.currentUser!.uid,
                authorName: _auth.currentUser!.email!.split("@")[0].toString(),
                category: category.toString(),
                images: imgUrl.toString(),
                title: title.text.trim().toString(),
                desc: desc.text.trim().toString(),
                postTime: DateTime.now().toString(),
                postDate: DateTime.now().toLocal().toString(),
                id: uniqueId),
            uniqueId);
        ctx.pop();
      });
    });
  }

  void removeUploadedImg() {
    imgFile.value = File("");
  }

  void saveBlogToFireStore(BlogModel blogModel, String uniqueId) async {
    print("in saveBlogToFireStore ");
    await _dbRef.collection("blogs").doc(uniqueId).set(blogModel.toJson());
    print("in saveBlogToFireStore lastline");
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
