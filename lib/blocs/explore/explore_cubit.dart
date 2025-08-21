// ... other imports
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/data/repos/recipe_repo.dart';
import 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final IRecipeRepository _recipeRepository; // Depend on the interface

  ExploreCubit({required IRecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository,
        super(const ExploreState.initial(
         
        ));

  /// Fetches all initial data needed for the Explore screen.
  /// This is now a synchronous method.
  void loadRecipes() {
    // No need to emit a loading state, as it's instant.
    final allRecipes = _recipeRepository.fetchAllRecipes();
    
    // We can still handle the case where the hardcoded list might be empty.
    if (allRecipes.isEmpty) {
        // We still need a way to represent this. For now, let's assume it won't be empty.
        // In a real app, you might have a dedicated 'empty' state.
        // For simplicity, we'll just emit a loaded state with an empty list.
        emit(ExploreState.loaded(allRecipes: []));
        return;
    }
    
    emit(ExploreState.loaded(allRecipes: allRecipes));
  }


  void toggleViewType(){
    final currentState = state.mapOrNull(
      loaded: (loadedState) {
        return ExploreState.loaded(
          allRecipes: loadedState.allRecipes,
          searchQuery: loadedState.searchQuery,
          viewType: loadedState.viewType == ExploreViewType.list ? ExploreViewType.grid : ExploreViewType.list,
        );
      },
    );
    if (currentState != null) {
      emit(currentState);
    }
  }


  void searchChanged(String newQuery) {
    final currentState = state.mapOrNull(
      loaded: (loadedState){
        return  loadedState.copyWith(searchQuery: newQuery);
      }
    );
   
   if (currentState != null) {
      emit(currentState);
    }
  }


  // ... other methods like searchChanged and toggleViewType
}