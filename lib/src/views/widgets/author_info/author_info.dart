import 'package:blogger_app/core/consts/styles/app_style.dart';
import 'package:flutter/cupertino.dart';

class AuthorCardInfo extends StatelessWidget {
  bool? blackTxt;
  AuthorCardInfo({super.key, @optionalTypeArgs this.blackTxt});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              "Ava Martinez",
              style: blackTxt ?? false
                  ? ThemeText.blogText
                  : ThemeText.blogTextBlack,
            ),
            Text(
              "4d ago",
              style: blackTxt ?? false
                  ? ThemeText.blogText
                  : ThemeText.blogTextBlack,
            ),
          ],
        )
      ],
    );
  }
}
