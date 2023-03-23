import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:blogger_app/src/views/screens/createBlogscreen/widgets/choice_chip.dart';

class CategoryChooseList extends StatelessWidget {
  const CategoryChooseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 2,
      children: [
        CategoryChoiceChip(category: "Food"),
        CategoryChoiceChip(category: "Travel"),
        CategoryChoiceChip(category: "Health"),
        CategoryChoiceChip(category: "Lifestyle"),
        CategoryChoiceChip(category: "Fashion & Beauty"),
        CategoryChoiceChip(category: "Photography"),
        CategoryChoiceChip(category: "Personal"),
        CategoryChoiceChip(category: "DIY craft"),
        CategoryChoiceChip(category: "Parenting"),
        CategoryChoiceChip(category: "Music"),
        CategoryChoiceChip(category: "Business"),
        CategoryChoiceChip(category: "Art and design "),
        CategoryChoiceChip(category: "Book and writing"),
        CategoryChoiceChip(category: "Personal finance"),
        CategoryChoiceChip(category: "Interior design"),
        CategoryChoiceChip(category: "Sports"),
        CategoryChoiceChip(category: "News"),
        CategoryChoiceChip(category: "Movie "),
        CategoryChoiceChip(category: "Political"),
        CategoryChoiceChip(category: "Science"),
      ],
    );
  }
}
