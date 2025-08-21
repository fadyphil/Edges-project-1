import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/blocs/favourited/favourited_state.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

class FavouritedCubit extends Cubit<FavouritedState> {
  FavouritedCubit() : super(const FavouritedState());

  void toggleFavourite(Recipe recipe) {

    final currentFavourites = Set<Recipe>.from(state.favouritedRecipes);
    if (currentFavourites.contains(recipe)) {
      currentFavourites.remove(recipe);
    } else {
      currentFavourites.add(recipe);
    }
    emit(state.copyWith(favouritedRecipes: currentFavourites));
  }

}