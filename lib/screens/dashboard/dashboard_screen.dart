import 'package:flutter/material.dart';
import 'package:monitoralogsguiflutter/constraints.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Dashboard',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Expanded(
                  child: TextField(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
