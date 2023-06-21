import 'package:flutter/material.dart';
import 'package:recipes/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              category.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: 160,
              height: 45,
              color: Colors.black45,
              child: Text(
                category.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
