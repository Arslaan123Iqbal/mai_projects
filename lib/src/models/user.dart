import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONE = 'phone';

  String _name;
  String _email;
  String _id;
  String _phone;

//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get phone => _phone;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _name = data[NAME];
    _email = data[EMAIL];
    _phone = data[PHONE];
    _id = data[ID];

    _name = snapshot.get('name');
    _email = snapshot.get('email');
    _phone = snapshot.get('phone');
    _id = snapshot.get('id');
  }
}
