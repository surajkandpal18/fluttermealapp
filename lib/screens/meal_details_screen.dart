import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function toggleFavorite;
  final Function isMealFav;
  MealDetails(this.toggleFavorite, this.isMealFav);

  Widget buildSectionTitle(String text, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeals.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(ctx).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeals.ingredients[index]),
                  ),
                );
              },
              itemCount: selectedMeals.ingredients.length,
            )),
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(selectedMeals.steps[index]),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: selectedMeals.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child:
              Icon(isMealFav(mealId) ? Icons.favorite : Icons.favorite_border),
          onPressed: () => toggleFavorite(mealId)),
    );
  }
}
