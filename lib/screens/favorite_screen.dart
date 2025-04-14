import 'package:flutter/material.dart';
import '../models/meal_model.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final void Function(Meal) onDelete;
  final void Function(Meal) onMealTap;

  const FavoriteScreen({
    super.key,
    required this.favoriteMeals,
    required this.onDelete,
    required this.onMealTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Meals')),
      body:
          favoriteMeals.isEmpty
              ? const Center(child: Text('No favorite meals yet!'))
              : ListView.builder(
                itemCount: favoriteMeals.length,
                itemBuilder: (context, index) {
                  final meal = favoriteMeals[index];
                  return ListTile(
                    leading: Image.network(meal.imageUrl, width: 50),
                    title: Text(meal.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => onDelete(meal),
                    ),
                    onTap: () => onMealTap(meal),
                  );
                },
              ),
    );
  }
}
