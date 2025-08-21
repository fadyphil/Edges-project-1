// lib/data/models/nutrition_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_model.freezed.dart';

/// Represents the nutritional information for a recipe.
@freezed
abstract class Nutrition with _$Nutrition {
  const factory Nutrition({
    required int calories,
    required int protein,
    required int carbs,
  }) = _Nutrition;
}