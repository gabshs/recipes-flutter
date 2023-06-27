import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      meal.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 20,
                          ),
                          Text(
                            '${meal.duration} minutos',
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 12,
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
                            Icons.signal_cellular_alt,
                            size: 20,
                          ),
                          Text(
                            meal.complexityText,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 12,
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
    );
  }
}
