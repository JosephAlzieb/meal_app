import 'package:Meal_App/models/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import '../meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "mealDetails";
  final Function setFavorite;
  final List<Meal> favoriteMeals;

  MealDetailScreen(this.setFavorite, this.favoriteMeals);

  Widget setTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  bool isFavorite (String mealId){
    return favoriteMeals.any((element) => element.id == mealId);
  }


  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealID);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              selectMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          setTitle(context, "Ingredients"),
          buildContainer(
            context,
            ListView.builder(
              itemBuilder: (_, index) => Card(
                color: Colors.orange,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(
                    selectMeal.ingredients[index],
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              itemCount: selectMeal.ingredients.length,
            ),
          ),
          setTitle(context, "Steps"),
          buildContainer(context, ListView.builder(
            itemBuilder: (_, index) => ListTile(
              title: Text(selectMeal.steps[index]),
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text("#${index+1}", style: TextStyle(color: Colors.white),),
              ),
            ),
            itemCount: selectMeal.steps.length,
          ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealID) ? Icons.star: Icons.star_border,  color: Colors.white,),
        onPressed: ()=>setFavorite(mealID),
      ),
    );
  }
}
