import 'package:story_app_v2/Data/Core/Url.dart';
import 'package:story_app_v2/Data/Data%20Source/Contacts%20Source/ContactsAbs.dart';
import 'package:story_app_v2/Data/Models/Contacts%20Model/ContactsModel.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ContactsImp implements ContactsAbs {
  @override
  void deleteContact(String id) async {
    await http.delete(Uri.parse("$baseUrl/contacts/$id"));
  }

  @override
  void editContact() {}

  @override
  Future<List<ContactsModel>> getContacts() async {
    Response response = await http.get(Uri.parse("$baseUrl/contacts"));
    List<ContactsModel> contactsList = getContactsFromJson(response.body);
    return contactsList;
  }
  
}