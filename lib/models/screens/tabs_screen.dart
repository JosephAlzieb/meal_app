import 'package:Meal_App/models/screens/screenCategory.dart';
import 'package:Meal_App/models/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../meal.dart';
import 'favorites_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _screenIndex = 0;

  void _selectItem(int value) {
    setState(() {
      _screenIndex = value;
    });
  }

  var _Pages;

  @override
  void initState() {
   _Pages = [
    {
    "title": "Categories",
    "page": ScreenCategory(),
    },
    {
    "title": "Favorites",
    "page": FavoriteScreen(widget.favoriteMeals),
    }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _Pages[_screenIndex]["title"],
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: _Pages[_screenIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectItem,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _screenIndex,
        mouseCursor: MouseCursor.uncontrolled,
        //backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
