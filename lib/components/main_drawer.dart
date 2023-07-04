import 'package:flutter/material.dart';
import 'package:recipes/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 41,
        color: Colors.black,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: Colors.black,
            child: const Center(
              child: Text(
                'Flutter Recipes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.restaurant,
            'Categorias',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          _createItem(
            Icons.toggle_on,
            'Filtros',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
          )
        ],
      ),
    );
  }
}
