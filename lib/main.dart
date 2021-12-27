import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'models/meal.dart';
import 'models/screens/category_meal_screen.dart';
import 'models/screens/filter_screen.dart';
import 'models/screens/meal_detail_screen.dart';
import 'models/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];



  Map <String, bool>filters = {
    "gluten" : false,
    "lactose" :false,
    "vegan"  :false,
    "vegetarian":false,
  };

  void _setFavorite(String mealId){
    var _favoriteIndex = _favoriteMeals.indexWhere((element) => element.id == mealId);

    if (_favoriteIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(_favoriteIndex);
      });
    }
    else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));

      });
    }

  }


  void selectedFilters(Map<String, bool> selectedFilters){
    setState(() {
      filters = selectedFilters;
      _meals = DUMMY_MEALS.where((element){
        if(selectedFilters["gluten"] && !element.isGlutenFree){
          return false;
        }
        if(selectedFilters["lactose"] && !element.isLactoseFree){
          return false;
        }
        if(selectedFilters["vegan"] && !element.isVegan){
          return false;
        }
        if(selectedFilters["vegetarian"] && !element.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          //accentColor: Colors.deepOrangeAccent,
          //canvasColor: Color.fromRGBO(236, 134, 22, 0.9411764705882353),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            bodyText2: TextStyle(
              color: Colors.black54.withOpacity(.5),
            ),
            subtitle1: const TextStyle(
              fontSize: 22,
              //fontFamily: "RobotoCondensed",
              fontWeight: FontWeight.bold,
            ),
          )),
      routes: {
        '/': (context) => TabScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(_meals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_setFavorite, _favoriteMeals),
        FilterScreen.routeName: (context) => FilterScreen( filters ,selectedFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: null,
    );
  }
}
