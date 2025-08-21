import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/blocs/recipe_details/recipe_details_state.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  // CORRECTED CONSTRUCTOR:
  // It takes the recipe and creates the initial state.
  RecipeDetailsCubit({required Recipe recipe}) 
    : super(RecipeDetailsState(recipe: recipe));

  void toggleTab(RecipeTab newTab) {
    // The state from a cubit is of type RecipeDetailsState, not _Loaded,
    // so we can't directly access `state.tab`.
    // We must use .when or .map to access the properties of a specific state.
    state.when(
      (recipe, currentTab) { // Renamed 'tab' to 'currentTab' to avoid shadowing
        if (currentTab == newTab) return;
        
        // Use copyWith on the current state's data
        emit(state.copyWith(tab: newTab));
      },
    );
  }
}