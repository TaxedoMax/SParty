import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sparty/core/utils.dart';
import 'package:sparty/features/users/data/user_repository.dart';

import '../../../core/database/models/user.dart';

class UserService{
  UserService(this._repository);
  final UserRepository _repository;

  Future<void> loadUsersFromContacts() async {
    if(await Permission.contacts.request().isGranted){
      final contacts = await FlutterContacts.getContacts(withProperties: true);

      for(var contact in contacts){
        if(contact.phones.isNotEmpty){
          await _repository.createUser(User(
            id: null,
            name: "${contact.name.first} ${contact.name.last}",
            phoneNumber: normalizePhoneNumber(contact.phones.first.number),
          ));
        }
      }

    }
  }

  Future<List<User>> getAllUsers() async {
    return await _repository.getAllUsers();
  }
}