import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/views/screens/profilescreen/widgets/followers_info.dart';
import 'package:blogger_app/src/views/screens/profilescreen/widgets/user_options.dart';
import 'package:blogger_app/src/views/widgets/blog_card_horiz/blog_card_horiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:blogger_app/core/themes/themes.dart';
import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blogger_app/src/views/screens/homescreen/widgets/blog_cards.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  String? id;
  ProfileScreen({super.key, this.id});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authController = Get.find<AuthController>();

  final blogsController = Get.find<BlogsController>();

  @override
  void initState() {
    super.initState();
    asyncFnc();
  }

  Future<void> asyncFnc() async {
    await blogsController.fetchAllBlogs();
    blogsController.getUsersBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.white,
          elevation: 0.0,
          foregroundColor: ThemeColor.blackBasic,
          title: const Text("My Profile"),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: ThemeColor.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 100,

                    // decoration: BoxDecoration(color: Colors.amber),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(authController
                                  .googleAccount.value?.photoUrl ??
                              "https://images.unsplash.com/photo-1679412330231-4a049ffd294b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                authController.googleAccount.value?.displayName
                                        .toString() ??
                                    authController.auth.currentUser!.email!
                                        .split("@")[0]
                                        .toString(),
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(fontSize: 27)),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                "What would you dream if you knew you couldn't fail!",
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(
                                            255, 153, 153, 153))),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  //info_acc
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FollowerInfo(
                          title: "Blogs",
                          num: blogsController.usersBlog.length.toString(),
                        ),
                        FollowerInfo(
                          title: "Followers",
                          num: "20",
                        ),
                        FollowerInfo(
                          title: "Following",
                          num: "10",
                        ),
                      ],
                    ),
                  ),

                  //more options
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(),

                  //user options
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      UserOptions(
                          title: "Your Bookmarks",
                          icon: CupertinoIcons.bookmark_fill),
                      const SizedBox(
                        height: 25,
                      ),
                      // UserOptions(
                      //     title: "Your Blogs", icon: CupertinoIcons.doc_plaintext),
                      Divider(),
                      const SizedBox(
                        height: 10,
                      ),

                      //User Blogs
                      Text(
                        "Your Blogs",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 20)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: blogsController.usersBlog.length,
                        itemBuilder: (context, index) {
                          return BlogCardsHoriz(
                            user: true,
                            e: blogsController.usersBlog[index],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ThemeColor.blackBasic,
          onPressed: () =>
              context.pushNamed(AppRouteConsts.createBlog, params: {
            "id":
                "${authController.auth.currentUser?.uid ?? authController.googleAccount.value!.id}"
          }),
          child: Icon(Icons.post_add),
        )));
  }
}
