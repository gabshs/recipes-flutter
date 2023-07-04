import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final bool Function(Meal) isFavoriteFood;
  final Function(Meal) onToggleFavorite;

  const MealDetailScreen({
    super.key,
    required this.isFavoriteFood,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          iconTheme: const IconThemeData(
              color: Colors.white,
              shadows: [Shadow(color: Colors.black, blurRadius: 15)]),
          actions: [
            IconButton(
              onPressed: () {
                onToggleFavorite(meal);
              },
              icon: isFavoriteFood(meal)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.40,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.timer_outlined,
                                      size: 40,
                                    ),
                                    Text(
                                      '${meal.duration} minutos',
                                      style: const TextStyle(
                                          fontFamily: 'Nunito', fontSize: 12),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.bar_chart_rounded,
                                      size: 40,
                                    ),
                                    Text(
                                      meal.complexityText,
                                      style: const TextStyle(
                                          fontFamily: 'Nunito', fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              meal.title,
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 34),
                              child: Text(
                                'Ingredientes',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            ...meal.ingredients
                                .map((ingredient) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.red,
                                            ),
                                          ),
                                          Text(
                                            ingredient,
                                            style: const TextStyle(
                                              fontFamily: 'Nunito',
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Modo de Preparo',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ...meal.steps
                                .asMap()
                                .keys
                                .toList()
                                .map((index) => Container(
                                      width: 300,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        '${index + 1}. ${meal.steps[index]}',
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 18,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
