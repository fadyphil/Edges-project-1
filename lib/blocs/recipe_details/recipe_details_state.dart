import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_1/data/models/enums.dart';


import '../../data/models/recipe_model.dart';

part 'recipe_details_state.freezed.dart';

@freezed
abstract class RecipeDetailsState with _$RecipeDetailsState {
  const factory RecipeDetailsState({
    required Recipe recipe,
    @Default(RecipeTab.overview) RecipeTab tab,
  }) = _Loaded;
}