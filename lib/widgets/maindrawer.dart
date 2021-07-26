import 'package:flutter/material.dart';
import 'package:meal_app/screens/filterScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
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
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text('Cooking Up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          SizedBox(
            height: 20,
          ),
          buildTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
