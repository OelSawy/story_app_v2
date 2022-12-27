import 'package:story_app_v2/Data/Models/Contacts%20Model/ContactsModel.dart';

abstract class ContactsAbs {
  Future<List<ContactsModel>> getContacts();

  void deleteContact(String id);

  void editContact();
}