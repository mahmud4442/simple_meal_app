import 'package:flutter/material.dart';
import 'models/meal_model.dart';
import 'screens/home_screen.dart';
import 'screens/favorite_screen.dart';
import 'screens/add_meal_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'services/meal_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> meals = [];
  List<Meal> favoriteMeals = [];

  @override
  void initState() {
    super.initState();
    _loadInitialMeals();
  }

  void _loadInitialMeals() async {
    final fetchedMeals = await MealService.fetchMeals();
    setState(() {
      meals = fetchedMeals;
    });
  }

  void addMeal(Meal meal) {
    setState(() {
      meals.add(meal);
    });
  }

  void toggleFavorite(Meal meal) {
    setState(() {
      if (favoriteMeals.contains(meal)) {
        favoriteMeals.remove(meal);
      } else {
        favoriteMeals.add(meal);
      }
    });
  }

  void deleteFavorite(Meal meal) {
    setState(() {
      favoriteMeals.remove(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Meal App',
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false, // Add because of debug option remove
      initialRoute: '/',
      routes: {
        '/':
            (context) => HomeScreen(
              meals: meals,
              onMealTap: (meal) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MealDetailScreen(meal: meal),
                  ),
                );
              },
              toggleFavorite: toggleFavorite,
              favoriteMeals: favoriteMeals,
            ),
        '/favorites':
            (context) => FavoriteScreen(
              favoriteMeals: favoriteMeals,
              onDelete: deleteFavorite,
              onMealTap: (meal) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MealDetailScreen(meal: meal),
                  ),
                );
              },
            ),
        '/add': (context) => AddMealScreen(onAdd: addMeal),
      },
    );
  }
}
