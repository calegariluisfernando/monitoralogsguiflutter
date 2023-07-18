import 'package:flutter/material.dart';
import 'package:monitoralogsguiflutter/constants.dart';
import 'package:monitoralogsguiflutter/screens/home/home_screen.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackgroud,
      appBar: myAppBar,
      body: Row(
        children: [
          myDrawer,
          HomeScreen(),
        ],
      )
    );
  }
}
