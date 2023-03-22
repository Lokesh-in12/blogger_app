class UserModel {
  String? id;
  String? username;
  String? email;
  String? phoneNo;
  String? hashPass;
  List? blogs;

  UserModel({this.username, this.email, this.phoneNo, this.hashPass, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    hashPass = json['hashPass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    data['hashPass'] = hashPass;
    return data;
  }
}
