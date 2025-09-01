// lib/blocs/explore/explore_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/repos/recipe_repo.dart';
import 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final IRecipeRepository _recipeRepository;

  ExploreCubit({required IRecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository,
        super(const ExploreState.initial());

  void loadRecipes() {
    final allRecipes = _recipeRepository.fetchAllRecipes();

    if (allRecipes.isEmpty) {
      // For the empty case, provide an empty list and empty set of tags
      emit(const ExploreState.loaded(allRecipes: [], allTags: {}));
      return;
    }

    // --- FIX #1: Calculate allTags from the recipes ---
    // Use expand() to flatten the list of lists of tags, then toSet() to get unique values.
    final allTags = allRecipes.expand((recipe) => recipe.tags).toSet();

    // --- FIX #2: Provide the required allTags parameter ---
    emit(ExploreState.loaded(allRecipes: allRecipes, allTags: allTags));
  }

  void toggleViewType() {
    // Use copyWith for cleaner state updates
    state.mapOrNull(
      loaded: (loadedState) {
        emit(loadedState.copyWith(
          viewType: loadedState.viewType == ExploreViewType.list
              ? ExploreViewType.grid
              : ExploreViewType.list,
        ));
      },
    );
  }

  void searchChanged(String newQuery) {
    state.mapOrNull(
      loaded: (loadedState) {
        emit(loadedState.copyWith(searchQuery: newQuery));
      },
    );
  }
  
  // --- ADDED: Methods for the Filter Bottom Sheet ---

  void toggleTag(String tag) {
    state.mapOrNull(loaded: (loadedState) {
      final currentSelectedTags = Set<String>.from(loadedState.selectedTags);

      if (currentSelectedTags.contains(tag)) {
        currentSelectedTags.remove(tag);
      } else {
        currentSelectedTags.add(tag);
      }

      emit(loadedState.copyWith(selectedTags: currentSelectedTags));
    });
  }

  void clearFilters() {
    state.mapOrNull(loaded: (loadedState) {
      // Reset selectedTags to an empty set
      emit(loadedState.copyWith(selectedTags: {}));
    });
  }
}