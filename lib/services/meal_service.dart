import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal_model.dart';

class MealService {
  static Future<List<Meal>> fetchMeals() async {
    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/search.php?s=',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List mealsJson = data['meals'];
      return mealsJson.map((meal) => Meal.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
