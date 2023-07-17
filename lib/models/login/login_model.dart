import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier {
  String email = '', password = '';

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }
}
