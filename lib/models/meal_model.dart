class Meal {
  final String id;
  final String name;
  final String imageUrl;
  final String instructions;

  Meal({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.instructions,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      instructions: json['strInstructions'] ?? '',
    );
  }
}
