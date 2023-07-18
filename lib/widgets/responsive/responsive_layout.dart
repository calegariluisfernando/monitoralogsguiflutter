import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobilescaffold, tabletScaffold, desktopScaffold;

  const ResponsiveLayout(
      {required this.mobilescaffold,
      required this.tabletScaffold,
      required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 576) {
          return mobilescaffold;
        } else if (constraints.maxWidth < 992) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
