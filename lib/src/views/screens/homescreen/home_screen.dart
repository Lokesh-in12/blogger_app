import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/core/themes/themes.dart';
import 'package:blogger_app/src/controllers/auth_controller/auth_controller.dart';
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

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final authcontroller = Get.find<AuthController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("the user is=>> ${authcontroller.firebaseUser}");
    }
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
                const Icon(CupertinoIcons.search),
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
      body: Padding(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                BlogCards(
                                  boxWidth: 280,
                                  boxHeight: 290,
                                ),
                                BlogCards(
                                  boxWidth: 280,
                                  boxHeight: 290,
                                ),
                                BlogCards(
                                  boxWidth: 280,
                                  boxHeight: 290,
                                ),
                                BlogCards(
                                  boxWidth: 280,
                                  boxHeight: 290,
                                ),
                                BlogCards(
                                  boxWidth: 280,
                                  boxHeight: 290,
                                ),
                              ],
                            ),
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
                                spacing: 18,
                                runSpacing: 15,
                                children: const [
                                  CategoryCard(),
                                  CategoryCard(),
                                  CategoryCard(),
                                  CategoryCard(),
                                  CategoryCard(),
                                  CategoryCard(),
                                  CategoryCard(),
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
                                itemCount: 5,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return BlogCardsHoriz(
                                    user: false,
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
      ),
    );
  }
}
