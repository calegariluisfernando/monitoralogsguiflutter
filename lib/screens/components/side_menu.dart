import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enabled scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.abc_sharp,
                size: 100,
              ),
            ),
            DrawerListTitle(
                title: 'Dashboard',
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white54,
                ),
                press: () {}),
            DrawerListTitle(
              title: 'Transaction',
              icon: Icon(
                Icons.confirmation_num_sharp,
                color: Colors.white54,
              ),
              press: () {},
            ),
            DrawerListTitle(
              title: 'Task',
              icon: Icon(
                Icons.task,
                color: Colors.white54,
              ),
              press: () {},
            ),
            DrawerListTitle(
              title: 'Documents',
              icon: Icon(
                Icons.document_scanner,
                color: Colors.white54,
              ),
              press: () {},
            ),
            DrawerListTitle(
              title: 'Store',
              icon: Icon(
                Icons.store,
                color: Colors.white54,
              ),
              press: () {},
            ),
            DrawerListTitle(
              title: 'Notification',
              icon: Icon(
                Icons.notifications,
                color: Colors.white54,
              ),
              press: () {},
            ),
            DrawerListTitle(
              title: 'Profile',
              icon: Icon(
                Icons.propane,
                color: Colors.white54,
              ),
              press: () {},
            ),
            DrawerListTitle(
              title: 'Settings',
              icon: Icon(
                Icons.settings,
                color: Colors.white54,
              ),
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTitle extends StatelessWidget {
  const DrawerListTitle(
      {Key? key, required this.title, required this.icon, required this.press})
      : super(key: key);

  final String title;
  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
