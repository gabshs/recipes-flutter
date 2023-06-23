import 'package:flutter/material.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoryMealsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
    );
  }
}
