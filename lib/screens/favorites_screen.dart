import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            favoriteMeals[i].id,
            favoriteMeals[i].title,
            favoriteMeals[i].imageUrl,
            favoriteMeals[i].duration,
            favoriteMeals[i].complexity,
            favoriteMeals[i].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
