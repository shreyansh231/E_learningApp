import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListile(String title, IconData icon, VoidCallback tapReader) {
    return ListTile(
      onTap: tapReader,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.centerLeft,
            child: Text(
              'E_Learning',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListile(
            'DashBoard',
            Icons.dashboard,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListile(
            'ChatSupport',
            Icons.help,
            () {},
          ),
        ],
      ),
    );
  }
}
