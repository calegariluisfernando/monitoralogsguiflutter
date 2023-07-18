import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoralogsguiflutter/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:monitoralogsguiflutter/models/login/login_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginModel()),
        ],
        child: Consumer<LoginModel>(
          builder: (context, loginModel, child) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(32),
                child: SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 32),
                      const FlutterLogo(size: 120),
                      const SizedBox(height: 32),
                      TextField(
                        onChanged: (value) => loginModel.updateEmail(value),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        onChanged: (value) => loginModel.updatePassword(value),
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Consumer<UserModel>(
                        builder: (context, userModel, child) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () =>
                                  _login(context, loginModel, userModel),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                              child: const Text('Entrar'),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        loginModel.email,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _login(
      BuildContext context, LoginModel loginModel, UserModel userModel) async {
    const url = 'http://localhost:8001/api/auth/login';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': loginModel.email,
        'password': loginModel.password,
      },
    );

    if (response.statusCode == 200) {
      // Login bem-sucedido, redirecione para a próxima tela
      Map<String, dynamic> responseData = jsonDecode(response.body);
      String token = responseData['token'];

      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token);

      userModel.updateFromMap(responseData);
    } else {
      // Exiba uma mensagem de erro ao usuário
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro de login'),
          content: const Text('Credenciais inválidas. Tente novamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
