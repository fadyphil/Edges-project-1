// lib/data/models/recipe_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_1/data/models/enums.dart'; // <-- IMPORTANT: Replace 'your_app_name'
import 'package:mini_project_1/data/models/step_model.dart';
import 'package:mini_project_1/data/models/ingredient_model.dart';
import 'package:mini_project_1/data/models/nutrition_model.dart';

part 'recipe_model.freezed.dart';

/// Represents the core recipe data. This is a pure, immutable data model.
@freezed
abstract class Recipe with _$Recipe {
  // A private constructor is needed by freezed to add our custom getters.
  const Recipe._();

  const factory Recipe({
    required String id,
    required String name,
    required String description,
    required String imagePath,
    required List<String> tags,
    required MealBase mealType,
    required RecipeDifficulty difficulty,
    required int acceptanceMarginInSeconds,
    required List<Step> steps,
    required List<Ingredient> ingredients,
    required Nutrition nutrition,
  }) = _Recipe;

  /// The total number of steps in the recipe.
  int get stepCount => steps.length;

  /// The total base time for the recipe, before applying any user level multipliers.
  int get totalBaseTimeInSeconds =>
      steps.fold(0, (sum, step) => sum + step.baseTimeInSeconds);

  int get cookingTimeInSeconds => steps
  .where((step)=>step.type==StepType.cooking)
  .fold(0, (sum,step)=>sum+step.baseTimeInSeconds);

  int get prepTimeInSeconds => steps
  .where((step)=> step.type==StepType.prep)
  .fold(0, (sum, step) => sum + step.baseTimeInSeconds);
}