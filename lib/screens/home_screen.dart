import 'package:flutter/material.dart';
import '../models/meal_model.dart';

class HomeScreen extends StatefulWidget {
  final List<Meal> meals;
  final void Function(Meal) onMealTap;
  final void Function(Meal) toggleFavorite;
  final List<Meal> favoriteMeals;

  const HomeScreen({
    super.key,
    required this.meals,
    required this.onMealTap,
    required this.toggleFavorite,
    required this.favoriteMeals,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/add'),
          ),
        ],
      ),
      body:
          widget.meals.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: widget.meals.length,
                itemBuilder: (context, index) {
                  final meal = widget.meals[index];
                  final isFavorite = widget.favoriteMeals.contains(meal);
                  return ListTile(
                    leading: Image.network(meal.imageUrl, width: 50),
                    title: Text(meal.title),
                    trailing: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      onPressed: () => widget.toggleFavorite(meal),
                    ),
                    onTap: () => widget.onMealTap(meal),
                  );
                },
              ),
    );
  }
}
