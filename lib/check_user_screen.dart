import 'package:flutter/material.dart';
import 'package:monitoralogsguiflutter/widgets/responsive/desktop_scaffold.dart';
import 'package:monitoralogsguiflutter/widgets/responsive/mobile_scaffold.dart';
import 'package:monitoralogsguiflutter/widgets/responsive/responsive_layout.dart';
import 'package:monitoralogsguiflutter/widgets/responsive/tablet_scaffold.dart';

import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoralogsguiflutter/models/user_model.dart';

import 'package:monitoralogsguiflutter/screens/home/home_screen.dart';
import 'package:monitoralogsguiflutter/screens/login/login_screen.dart';

class CheckUserScreen extends StatefulWidget {
  const CheckUserScreen({super.key});

  @override
  State<CheckUserScreen> createState() => _CheckUserScreenState();
}

class _CheckUserScreenState extends State<CheckUserScreen> {
  bool _isTokenExists = false;

  @override
  void initState() {
    super.initState();
    (() async {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');
    })();
  }

  void _obterDadosUsuario(
      BuildContext context, UserModel userModel, String token) async {
    const url = 'http://localhost:8001/api/auth/me';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {}
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserModel(id: 0, name: '', email: ''),
        ),
      ],
      child: Consumer<UserModel>(
        builder: (context, userModel, child) {
          return const ResponsiveLayout(
            mobilescaffold: MobileScaffold(),
            tabletScaffold: TabletScaffold(),
            desktopScaffold: DesktopScaffold(),
          );
        },
      ),
    );
  }
}
