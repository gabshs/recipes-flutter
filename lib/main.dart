import 'package:flutter/material.dart';
import 'package:recipes/data/dummy_data.dart';
import 'package:recipes/screens/category_meals_screen.dart';
import 'package:recipes/screens/meal_detail_screen.dart';
import 'package:recipes/screens/tab_screen.dart';
import 'package:recipes/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final meals = dummyMeals;

    return MaterialApp(
      title: 'Flutter Recipes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: 'EBGaramond',
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const TabScreen(),
        AppRoutes.categoryMeals: (_) => CategoryMealsScreen(
              meals: meals,
            ),
        AppRoutes.mealDetail: (_) => const MealDetailScreen()
      },
    );
  }
}
