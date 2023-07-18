import 'package:flutter/material.dart';
import 'package:monitoralogsguiflutter/constants.dart';
import 'package:monitoralogsguiflutter/screens/home/home_screen.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({Key? key}) : super(key: key);

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
