import 'package:flutter/material.dart';
import '../models/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  final void Function(Meal) onAdd;

  const AddMealScreen({super.key, required this.onAdd});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _titleController = TextEditingController();
  final _imageController = TextEditingController();
  final _instructionsController = TextEditingController();

  void _submit() {
    final newMeal = Meal(
      id: DateTime.now().toString(),
      title: _titleController.text,
      imageUrl: _imageController.text,
      instructions: _instructionsController.text,
    );
    widget.onAdd(newMeal);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Meal')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _instructionsController,
              decoration: const InputDecoration(labelText: 'Instructions'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: const Text('Add Meal')),
          ],
        ),
      ),
    );
  }
}
