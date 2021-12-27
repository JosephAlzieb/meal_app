import 'package:Meal_App/models/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../meal.dart';
class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text("No favorites yet!"),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            title: favoriteMeals[index].title,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
