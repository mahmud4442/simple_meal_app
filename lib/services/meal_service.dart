import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal_model.dart';

class MealService {
  static Future<List<Meal>> fetchMeals() async {
    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/search.php?f=a',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List mealsData = data['meals'];
      return mealsData.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
