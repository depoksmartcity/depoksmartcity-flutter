import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  bool _admin = false;
  bool _login = false;
  String _username = "";

  bool get getAdmin => _admin;
  bool get getLogin => _login;
  String get getUsername => _username;
  
  void saveAdmin(bool admin) {
    _admin = admin;
    notifyListeners();
  }

  void saveLogin(bool login) {
    _login = login;
    notifyListeners();
  }

  void saveUsername(String username) {
    _username = username;
    notifyListeners();
  }
}