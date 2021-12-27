import 'package:Meal_App/models/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function ontap) {
    return ListTile(
      onTap: ontap,
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 55,
            width: double.infinity,
            child: Text("Meals App",
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center),
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile("HomePage", Icons.home_rounded, (){Navigator.of(context).pushReplacementNamed("/");}),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Filters", Icons.settings, (){Navigator.of(context).pushNamed(FilterScreen.routeName);}),
        ],
      ),
    );
  }
}
