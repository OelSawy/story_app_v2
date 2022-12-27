class LoginModel {
  DateTime? createdAt;
  String? name;
  String? avatar;
  String? username;
  String? mail;
  ProfileModel? profile;
  String? id;

  LoginModel.fromJson(Map<String, dynamic> json) {
    createdAt = DateTime.parse(json["createdAt"]);
    name = json["name"];
    avatar = json["avatar"];
    username = json["username"];
    mail = json["email"];
    profile = ProfileModel.fromJson(json["profile"]);
    id = json["id"];
  }
}

class ProfileModel{
  String? firstname;
  String? lastname;
  String? photo;
  List<dynamic>? favourites;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    firstname = json["firstName"];
    lastname = json["lastName"];
    photo = json["photo"];
    favourites = json["favorites"];
  }
}