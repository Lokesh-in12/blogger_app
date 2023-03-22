import 'package:nanoid/async.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? phoneNo;
  String? hashPass;
  List? blogs;

  UserModel({this.username, this.email, this.phoneNo, this.hashPass, this.id});
  // UserModel({this.username, this.email, this.phoneNo, this.hashPass});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    hashPass = json['hashPass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['hashPass'] = this.hashPass;
    return data;
  }
}
