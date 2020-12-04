import 'package:flutter/material.dart';
import '../screens/meal_screen.dart';
import '../screens/settings_screen.dart';

class NavgitaionDrawer extends StatelessWidget {
  Widget listTile(String text, IconData icon, Function function) {
    return ListTile(
      onTap: function,
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 160,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Text(
              'Meals App',
              style: TextStyle(fontSize: 34, color: Colors.white),
            ),
          ),
        ),
        listTile('Meal', Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/')),
        listTile(
            'Settings',
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(SettingsScreen.routName)),
      ],
    ));
  }
}
