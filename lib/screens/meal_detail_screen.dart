import 'package:flutter/material.dart';
import '../models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(height: 10),
            Text(meal.instructions, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
