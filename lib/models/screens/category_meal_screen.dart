import 'package:Meal_App/models/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "category_meals";

  final List <Meal>availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List meals;
  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg["id"];
    categoryTitle = routeArg["title"];
    meals = widget.availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeItem (String mealId){
    setState(() {
      meals.removeWhere((element) => element.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: meals[index].id,
            imageUrl: meals[index].imageUrl,
            duration: meals[index].duration,
            title: meals[index].title,
            complexity: meals[index].complexity,
            affordability: meals[index].affordability,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
