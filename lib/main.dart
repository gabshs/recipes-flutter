import 'package:flutter/material.dart';
import 'package:recipes/data/dummy_data.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/screens/category_meals_screen.dart';
import 'package:recipes/screens/meal_detail_screen.dart';
import 'package:recipes/screens/tab_screen.dart';
import 'package:recipes/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final meals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _toggleFavoriteMeals(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavoriteMeal(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Recipes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: 'EBGaramond',
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => TabScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.categoryMeals: (_) => CategoryMealsScreen(
              meals: meals,
            ),
        AppRoutes.mealDetail: (_) => MealDetailScreen(
              isFavoriteFood: _isFavoriteMeal,
              onToggleFavorite: _toggleFavoriteMeals,
            )
      },
    );
  }
}
