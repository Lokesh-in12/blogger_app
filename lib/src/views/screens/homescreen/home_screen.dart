import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/core/themes/themes.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
import 'package:blogger_app/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:blogger_app/src/views/screens/homescreen/widgets/blog_cards.dart';
import 'package:blogger_app/src/views/widgets/category/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blogger_app/src/views/widgets/blog_card_horiz/blog_card_horiz.dart';
import 'package:blogger_app/src/views/screens/homescreen/widgets/drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authcontroller = Get.find<AuthController>();
  final blogsController = Get.find<BlogsController>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    blogsController.fetchAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {}
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => scaffoldKey.currentState!.isDrawerOpen
                ? scaffoldKey.currentState!.closeDrawer()
                : scaffoldKey.currentState!.openDrawer(),
            icon: const Icon(
              CupertinoIcons.circle_grid_3x3_fill,
              size: 25,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: ThemeColor.blackBasic,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  // (CupertinoIcons.profile_circled)
                  IconButton(
                      onPressed: () => context.pushNamed(AppRouteConsts.profile,
                              params: {
                                "id": "${authcontroller.auth.currentUser?.uid}"
                              }),
                      icon: const Icon(CupertinoIcons.profile_circled))
                ],
              ),
            )
          ],
        ),
        drawer: MyDrawer(),
        body: Obx(() {
          final blogs = blogsController.AllBlogs;
          if (blogsController.AllBlogs.length == 0) {
            return Scaffold(
              body: Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: ThemeColor.blackBasic, size: 40)),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Blogs for you',
                              style: GoogleFonts.montserrat(
                                  textStyle: ThemeText.Heading2),
                            ),
                            //blog cards
                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                itemCount: blogsController.AllBlogs.reversed
                                    .take(5)
                                    .length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return BlogCards(
                                    boxWidth: 280,
                                    boxHeight: 290,
                                    e: blogsController.AllBlogs.reversed
                                        .take(5)
                                        .toList()[index],
                                  );
                                },
                              ),
                            ),

                            //categories
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Let's Pick one",
                                    style: ThemeText.heading3,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Wrap(
                                    spacing: 17,
                                    runSpacing: 15,
                                    children: [
                                      CategoryCard(
                                        title: "Food",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "Travel",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "Health",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "Lifestyle",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "Fashion",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "Photgraphy",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "Personal",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "Business",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "DIY",
                                        posting: false,
                                      ),
                                      CategoryCard(
                                        title: "Movies",
                                        posting: false,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            //all blogs

                            const SizedBox(
                              height: 20,
                            ),

                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "All Blogs",
                                    style: ThemeText.heading3,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: blogsController.AllBlogs.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return BlogCardsHoriz(
                                        user: false,
                                        e: blogsController.AllBlogs[index],
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ThemeColor.blackBasic,
          onPressed: () => context.pushNamed(AppRouteConsts.createBlog,
              params: {"id": "${authcontroller.auth.currentUser!.uid}"}),
          child: Icon(Icons.post_add),
        ));
  }
}
