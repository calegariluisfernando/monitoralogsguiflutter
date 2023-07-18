import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoralogsguiflutter/screens/login/login_screen.dart';

class CheckUserScreen extends StatefulWidget {
  const CheckUserScreen({super.key});

  @override
  State<CheckUserScreen> createState() => _CheckUserScreenState();
}

class _CheckUserScreenState extends State<CheckUserScreen> {
  bool _myState = false;

  @override
  void initState() {
    super.initState();
    (() async {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');
      if (token != null) {
        _obterDadosDoUsuario(token);
      }
      setState(() {
        _myState = token != null;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    if (_myState) {
      return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
          ],
        ),
      );
    } else {
      return const LoginScreen();
    }
  }

  _obterDadosDoUsuario(String token) async {
    const url = 'http://localhost:8001/api/auth/me';
    final response = await http.post(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    if (response.statusCode == 200) {
      // Login bem-sucedido, redirecione para a próxima tela
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData);
    }
  }
}
