import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;

  MealItem(
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
  );

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else {
      return 'Hard';
    }
  }

  String get affordabiltyText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else {
      return 'Luxurious';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${duration} mins'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
