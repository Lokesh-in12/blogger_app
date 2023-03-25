import 'package:blogger_app/core/routes/app_route_constants.dart';
import 'package:blogger_app/core/utils/helpers/time_formatter.dart';
import 'package:blogger_app/src/models/blog_model/blog_model.dart';
import 'package:blogger_app/src/views/widgets/category/sm_category_card.dart';
import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class BlogCardsHoriz extends StatelessWidget {
  bool? user;
  BlogModel? e;
  BlogCardsHoriz({super.key, this.user, this.e});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => context.pushNamed(AppRouteConsts.singleBlog,
              params: {"id": e!.id.toString()}),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 243, 242),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        e?.images ??
                            "https://images.unsplash.com/photo-1503220317375-aaad61436b1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      user!
                          ? SizedBox(
                              width: 230,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(Icons.more_horiz_rounded)
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                      radius: 10,
                                      backgroundImage: NetworkImage(
                                          "https://images.unsplash.com/photo-1679381457571-ade79f46c61c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      e?.authorName ??
                                          "dsgefksheugsigafesgeswgrg",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                          width: 210,
                          child: Text(
                            e?.title ??
                                "It's Been 20 Years Since We Invaded Iraq .I Am Still in the Desert ",
                            style: ThemeText.allBlogsTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          e?.desc.toString() ?? "This is a sample description",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(e?.postDate != null
                                    ? getPostTimeFormatted(
                                        e!.postDate.toString())
                                    : "2d ago"),
                                const SizedBox(
                                  width: 10,
                                ),
                                SmCategoryCard(title: e!.category.toString()),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                CupertinoIcons.bookmark,
                                size: 17,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
