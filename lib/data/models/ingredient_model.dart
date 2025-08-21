// lib/data/models/ingredient_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_1/data/models/enums.dart'; // <-- IMPORTANT: Replace 'your_app_name'

part 'ingredient_model.freezed.dart';


/// Represents a single ingredient with its quantity and unit.
@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String name,
    required double quantity,
    required MeasurementUnit unit,
  }) = _Ingredient;
}