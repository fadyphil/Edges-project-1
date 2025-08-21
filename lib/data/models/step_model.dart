// lib/data/models/step_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_1/data/models/enums.dart'; // <-- IMPORTANT: Replace 'your_app_name'

part 'step_model.freezed.dart';

/// Represents a single step within a recipe.
@freezed
abstract class Step with _$Step {
  const factory Step({
    required String title,
    required String description,
    required int baseTimeInSeconds,
    required StepType type,
    String? note,
  }) = _Step;
}