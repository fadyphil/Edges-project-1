
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';
part 'favourited_state.freezed.dart';

@freezed
abstract class FavouritedState with _$FavouritedState {

  const factory FavouritedState({
    @Default({}) Set<Recipe> favouritedRecipes,
  }) = _Loaded;

}