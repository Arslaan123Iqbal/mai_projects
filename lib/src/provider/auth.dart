import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mai_ecomm/src/helper/userservices.dart';
import 'package:mai_ecomm/src/models/user.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

//Sart class to declare all necessary  models

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;

  UserServices _userServices = UserServices();
  UserModel _userModel;

  //getters

  Status get status => _status;
  UserModel get userModel => _userModel;
  User get user => _user;

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  //Initialize Provider

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((User user) {
      _onAuthStateChanged(user);
    });
  }

  // Sign In with provider Email AND password

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim().toString(), password: password.text);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print("Error:" + e.toString());
      return false;
    }
  }

  //Signout method
  Future signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  //Sign Up provider  with email provider

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim().toString(), password: password.text)
          .then((user) {
        Map<String, dynamic> values = {
          "name": name.text,
          'phone': phone.text,
          'email': email.text,
          'id': user.user.uid
        };
        _userServices.createUser(values);
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print("Error:" + e.toString());
      return false;
    }
  }

//Function for AuthProvider
  Future<Void> _onAuthStateChanged(User firebaseuser) async {
    if (user == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseuser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserbyId(firebaseuser.uid);
    }
    notifyListeners();
  }

  // General Methods
//1 -Error method
  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print("We got an error:   $error");
    return false;
  }

  // clear method

  void clearController() {
    email.text = "";
    name.text = "";
    phone.text = "";
    password.text = "";
  }
}
