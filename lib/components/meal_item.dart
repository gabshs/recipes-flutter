import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.mealDetail, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFF5F5F5),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        meal.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              size: 18,
                              color: Colors.black45,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${meal.duration} minutos',
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.bar_chart_rounded,
                              size: 18,
                              color: Colors.black45,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              meal.complexityText,
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
