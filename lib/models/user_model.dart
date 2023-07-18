import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  int id;
  String name, email;
  String? email_verified_at, created_at, updated_at, token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.email_verified_at,
      this.created_at,
      this.updated_at,
      this.token});

  void updateFromMap(Map<String, dynamic> data) {
    id = data['user']['id'];
    notifyListeners();
  }
}
