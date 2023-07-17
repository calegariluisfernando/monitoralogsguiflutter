import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  int id = 0;
  String nome = '', email = '';

  void updateId(int value) {
    id = value;
    notifyListeners();
  }
}
