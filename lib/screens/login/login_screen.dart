import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:monitoralogsguiflutter/models/login/login_model.dart';
import 'package:monitoralogsguiflutter/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
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
                padding: EdgeInsets.all(32),
                child: SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 32),
                      FlutterLogo(size: 120),
                      SizedBox(height: 32),
                      TextField(
                        onChanged: (value) => loginModel.updateEmail(value),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        onChanged: (value) => loginModel.updatePassword(value),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _login(context, loginModel),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                          child: Text('Entrar'),
                        ),
                      ),
                      SizedBox(height: 16),
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

  void _login(BuildContext context, LoginModel loginModel) async {
    final url = 'http://localhost:8001/api/auth/login'; // Substitua pela URL da sua API
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

      final storage = new FlutterSecureStorage();
      await storage.write(key: 'token', value: token);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Exiba uma mensagem de erro ao usuário
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de login'),
          content: Text('Credenciais inválidas. Tente novamente.'),
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
