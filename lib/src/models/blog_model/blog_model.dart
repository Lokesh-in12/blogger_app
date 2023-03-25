import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  String? id;
  String? authorId;
  String? authorName;
  String? postTime;
  String? postDate;
  String? title;
  String? desc;
  String? category;
  String? images;
  List<dynamic>? bookmarkedBy;
  List<dynamic>? likes;

  BlogModel(
      {this.authorId,
      this.authorName,
      this.category,
      this.postDate,
      this.postTime,
      this.title,
      this.desc,
      this.bookmarkedBy,
      this.images,
      this.likes,
      this.id});

  BlogModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json['id'];
    authorId = json['authorId'];
    authorName = json['authorName'];
    postTime = json['postTime'];
    postDate = json['postDate'];
    title = json['title'];
    desc = json['desc'];
    category = json['category'];
    images = json['images'];
    bookmarkedBy = json['bookmarkedBy'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['authorId'] = authorId;
    data['authorName'] = authorName;
    data['postTime'] = postTime;
    data['postDate'] = postDate;
    data['title'] = title;
    data['desc'] = desc;
    data['category'] = category;
    data['images'] = images;
    data['bookmarkedBy'] = bookmarkedBy;
    data['likes'] = likes;
    return data;
  }
}
