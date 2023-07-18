import 'package:flutter/material.dart';

var myDefaultBackgroud = Colors.grey[300];

var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
  title: Text('Mobile Scaffold'),
);

var myDrawer = Drawer(
  semanticLabel: 'teste',
  backgroundColor: Colors.grey[300],
  child: const Column(
    children: [
      DrawerHeader(child: Icon(Icons.graphic_eq_outlined)),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('D A S H B O A R D'),
      ),
      ListTile(
        leading: Icon(Icons.timer_outlined),
        title: Text('A G U A R D E'),
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('S A I R'),
      ),
    ],
  ),
);
