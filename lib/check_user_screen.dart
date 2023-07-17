import 'package:flutter/material.dart';

class CheckUserScreen extends StatelessWidget {
  const CheckUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          )
        ],
      ),
    );
  }
}
