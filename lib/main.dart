import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoralogsguiflutter/check_user_screen.dart';
import 'package:provider/provider.dart';
import 'package:monitoralogsguiflutter/models/user_model.dart';
import 'package:monitoralogsguiflutter/screens/home/home_screen.dart';
import 'package:monitoralogsguiflutter/screens/login/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserModel(id: 0, name: '', email: ''),
          ),
        ],
        child: Consumer<UserModel>(
          builder: (context, userModel, child) {
            return const CheckUserScreen();
          },
        ),
      ),
    );
  }
}
