import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, this.title, required this.meals,required this.onToggleFavorite});

  String? title;
  final List<Meal> meals;
  final Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(meal: meal,onToggleFavorite: onToggleFavorite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'oh ho.....ntg here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.amberAccent,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'try selecting a diff category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.lightBlue,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((context, index) => MealIteam(
              meal: meals[index],
              onSelectMeal: (meal) {
                selectMeal(context, meal);
              },
            )),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
