class Meal {
  final String name;
  final String area;
  final String image;
  final String instructions;

  Meal({
    required this.name,
    required this.area,
    required this.image,
    required this.instructions,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['strMeal'],
      area: json['strArea'] ?? 'Unknown',
      image: json['strMealThumb'],
      instructions: json['strInstructions'] ?? 'No instructions available.',
    );
  }
}
