import 'package:flutter/material.dart';
import 'package:recipes/components/meal_item.dart';
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
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 20),
              child: Text(
                'Pratos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categoryMeals.length,
                itemBuilder: (context, index) {
                  final meal = categoryMeals[index];
                  return MealItem(meal: meal);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
