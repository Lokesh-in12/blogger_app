import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/src/models/blog_model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blogger_app/core/utils/helpers/time_formatter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BlogCards extends StatelessWidget {
  double? boxWidth;
  double? boxHeight;
  BlogModel? e;

  BlogCards({super.key, this.boxWidth, this.boxHeight, @required this.e});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRouteConsts.singleBlog,
          params: {"id": e!.id.toString()}),
      child: Row(
        children: [
          Container(
            width: boxWidth,
            height: boxHeight,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        e?.images.toString() ??
                            "https://images.unsplash.com/photo-1552733407-5d5c46c3bb3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1380&q=80",
                        fit: BoxFit.cover,
                        height: 230,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(85, 0, 0, 0),
                      ),
                      width: 80,
                      height: 25,
                      child: Center(
                          child: Text(
                        e?.category.toString() ?? "No Category",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: ThemeText.cardCategoryBlog,
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                e?.title.toString() ??
                                    "The principles of Design Thinking",
                                maxLines: 1,
                                style: ThemeText.blogsForYou,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    "https://images.unsplash.com/photo-1661956603025-8310b2e3036d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                                    width: 45,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e?.authorName ?? "Ava Martinez",
                                    style: ThemeText.blogs_author,
                                  ),
                                  Text(
                                    getPostTimeFormatted(
                                            e!.postTime.toString()) ??
                                        "",
                                    style: ThemeText.blogs_author,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
