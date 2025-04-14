class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final String instructions;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.instructions,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      title: json['strMeal'],
      imageUrl: json['strMealThumb'],
      instructions: json['strInstructions'] ?? '',
    );
  }
}
