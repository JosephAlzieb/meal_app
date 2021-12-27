import 'package:Meal_App/models/widgets/categoriesItem.dart';
import 'package:flutter/material.dart';

import '../../dummy_data.dart';

class ScreenCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(15.0),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoriesItem(catData.id, catData.title, catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3/2,
        ),
      ),
    );
  }
}
