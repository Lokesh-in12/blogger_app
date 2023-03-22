import 'package:blogger_app/src/views/widgets/category/sm_category_card.dart';
import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogCardsHoriz extends StatelessWidget {
  const BlogCardsHoriz({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 242),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1503220317375-aaad61436b1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                              radius: 10,
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1679381457571-ade79f46c61c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")),
                          SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
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
                    const SizedBox(
                        width: 210,
                        child: Text(
                          "It's Been 20 Years Since We Invaded Iraq .I Am Still in the Desert ",
                          style: ThemeText.allBlogsTitle,
                        )),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Mar 14"),
                        SizedBox(
                          width: 10,
                        ),
                        SmCategoryCard(),
                        SizedBox(
                          width: 100,
                        ),
                        Icon(
                          CupertinoIcons.bookmark,
                          size: 17,
                        )
                      ],
                    )
                  ],
                )
              ],
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
