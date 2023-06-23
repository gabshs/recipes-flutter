import 'package:flutter/material.dart';
import 'package:recipes/data/dummy_data.dart';
import 'package:recipes/screens/categories_screen.dart';
import 'package:recipes/screens/category_meals_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        fontFamily: 'EBGaramond',
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const CategoriesScreen(),
        AppRoutes.categoryMeals: (_) => CategoryMealsScreen(
              meals: meals,
            )
      },
    );
  }
}
