import 'package:flutter/material.dart';
import 'package:monitoralogsguiflutter/constants.dart';
import 'package:monitoralogsguiflutter/screens/home/home_screen.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackgroud,
      appBar: myAppBar,
      drawer: myDrawer,
      body: HomeScreen(),
    );
  }
}
