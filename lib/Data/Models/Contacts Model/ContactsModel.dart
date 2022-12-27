import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ContactsModel {
  String? name;
  String? date;
  String? image;
  String? id;

  ContactsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    date = json["createdAt"];
  }
}

List<ContactsModel> getContactsFromJson(String responseBody) => List<ContactsModel>.from(json.decode(responseBody).map((e) => ContactsModel.fromJson(e)));