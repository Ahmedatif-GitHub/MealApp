import 'package:flutter/material.dart';
import 'package:mealapplication/models/meal.dart';

import '../dummy_data.dart';

class MealProviders with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void  setFilters() {


    availableMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }
  bool isMealFavorite = false;

  void toggleFavorite(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
    } else {
      favoriteMeals.add(
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
      );
    }
    isMealFavorite = favoriteMeals.any((meal) => meal.id == mealId);
    notifyListeners();
  }


}
