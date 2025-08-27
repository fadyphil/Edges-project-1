import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/UI/widgets/random_picker.dart';
import 'package:mini_project_1/UI/widgets/recipe_card.dart';
import 'package:mini_project_1/UI/widgets/recipe_grid_card.dart';
import 'package:mini_project_1/UI/widgets/searchbarandviews.dart';
import 'package:mini_project_1/UI/widgets/today_challenge_card.dart';
import 'package:mini_project_1/blocs/explore/explore_cubit.dart';
import 'package:mini_project_1/blocs/explore/explore_state.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/models.dart';


@RoutePage()
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExploreCubit, ExploreState>(
        buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loaded: (_, __, ___, ____, _____) {
              final username = context.watch<UserCubit>().state.user.name;
              
              // THE CORE CHANGE: We now use CustomScrollView instead of Column.
              return SafeArea(
                child: CustomScrollView(
                  slivers: [
                    // --- SLIVERS FOR STATIC-LIKE CONTENT ---
                    // We wrap single "box" widgets in SliverToBoxAdapter to use them in a sliver list.
                    
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: _buildGreeetingSentence(_getTimeForGreeting(), username, context),
                      ),
                    ),

                    // Selector for Today's Challenge Card
                    SliverToBoxAdapter(
                      child: BlocSelector<ExploreCubit, ExploreState, Recipe?>(
                        selector: (state) => state.todaysChallenge,
                        builder: (context, recipe) {
                       
                          return recipe != null
                              ? TodayChallengeCard(recipe: recipe)
                              : const SizedBox.shrink();
                        },
                      ),
                    ),

                    const SliverToBoxAdapter(child: RandomPicker()),
                    SliverToBoxAdapter(child: _buildLabelSeparator(context)),

                    // Selector for the Search and Filter Bar
                    SliverToBoxAdapter(
                      child:
                     
                          
                           SearchAndFilterBar()
                      
                    
                    ),

                    // --- THE HIGHLY-PERFORMANT SLIVER LIST ---
                    // This selector now returns a SliverList or SliverGrid directly.
                    BlocBuilder<ExploreCubit, ExploreState>(
                      buildWhen: (previous, current) {
                        return previous.filteredRecipes != current.filteredRecipes
                        || previous.theViewType!=current.theViewType;
                      },
                      builder: (context,state){
                        return state.theViewType==ExploreViewType.grid?
                        _buildGridRceipes(context, state.filteredRecipes):
                        _buildRecipeListSliver(context, state.filteredRecipes) ;
                      }
                      )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // --- REFACTORED LIST BUILDER ---
  // This function now returns a Sliver, not a regular widget.
  Widget _buildRecipeListSliver(BuildContext context, List<Recipe> allRecipes) {
    if (allRecipes.isEmpty) {
      return const SliverFillRemaining( // A sliver that fills the remaining space
        child: Center(child: Text("No recipes found.",)),
      );
    }
    // SliverList is the sliver equivalent of ListView.builder and is LAZY.
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final recipe = allRecipes[index];
          return RecipeCard(recipe: recipe);
        },
        childCount: allRecipes.length,
      ),
    );
  }
  
  // NOTE: All your other helper methods (_buildGreeetingSentence, _buildLabelSeparator, etc.)
  // remain exactly the same. They are pasted below for completeness.

  Widget _buildLabelSeparator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Recipes',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }

  String _getTimeForGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Morning';
    if (hour < 17) return 'Afternoon';
    return 'Evening';
  }

Widget _buildGreeetingSentence(String greeting, String username, BuildContext context) {
  // Get the styles from the theme once to make the code cleaner
  final headlineStyle = Theme.of(context).textTheme.headlineSmall;
  final primaryColor = Theme.of(context).colorScheme.primary;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // Better vertical alignment
        children: [
          // --- THE FIX: Replace the inner Row with RichText ---
          // RichText is perfect for a single line of text with multiple styles.
          // It handles wrapping and overflow correctly as one element.
          Expanded(
            child: RichText(
              text: TextSpan(
                // Default style for the entire sentence
                style: headlineStyle?.copyWith(fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(text: 'Good $greeting, '),
                  TextSpan(
                    text: '$username!',
                    // Specific style for the username
                    style: headlineStyle?.copyWith(color: primaryColor),
                  ),
                ],
              ),
              maxLines: 2, // Allow it to wrap to a second line if needed
              overflow: TextOverflow.ellipsis, // Add ellipsis if it's still too long
            ),
          ),
          // --- END OF FIX ---

          const SizedBox(width: 8), // Add some spacing for safety
          _buildLevelDropdown(context)
        ],
      ),
      Text(
        'Ready to cook something amazing?',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
              color: const Color(0xFF888481),
            ),
      ),
    ],
  );
}
  Widget _getIconForLevel(UserCookingLevel level) {
    switch (level) {
      case UserCookingLevel.chef: return const Icon(Icons.whatshot_outlined, color: Colors.orange, size: 14);
      case UserCookingLevel.intermediate: return const Icon(Icons.local_dining, color: Colors.lightGreenAccent, size: 14);
      case UserCookingLevel.beginner: return const Icon(Icons.egg_alt_outlined, color: Colors.lightBlueAccent, size: 14);
    }
  }

  Widget _buildLevelDropdown(BuildContext context) {
    final currentUserLevel = context.watch<UserCubit>().state.user.level;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF181B21),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: const Color(0xFF2B2E33)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<UserCookingLevel>(
          isDense: true,
          iconSize: 16,
          value: currentUserLevel,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
          dropdownColor: const Color(0xFF181B21),
          style: GoogleFonts.nunito(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          onChanged: (UserCookingLevel? newLevel) {
            if (newLevel != null) {
              context.read<UserCubit>().changelevel(newLevel);
            }
          },
          selectedItemBuilder: (BuildContext context) {
            return UserCookingLevel.values.map((level) {
              return Row(children: [
                _getIconForLevel(level),
                const SizedBox(width: 2),
                Text(level.name[0] + level.name.substring(1), style: const TextStyle(color: Colors.white, fontSize: 16)),
              ]);
            }).toList();
          },
          items: UserCookingLevel.values.map((level) {
            return DropdownMenuItem<UserCookingLevel>(
              value: level,
              child: Row(children: [
                _getIconForLevel(level),
                const SizedBox(width: 8),
                Text(level.name[0].toUpperCase() + level.name.substring(1), style: const TextStyle(color: Colors.white, fontSize: 16)),
              ]),
            );
          }).toList(),
        ),
      ),
    );
  }
}



Widget _buildGridRceipes (BuildContext context, List<Recipe> allRecipes){
 return SliverGrid.builder(
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 280,
    crossAxisSpacing:0,
    mainAxisSpacing: 4,
    mainAxisExtent: 220
    ), 
  itemCount: allRecipes.length,
  itemBuilder: (BuildContext context, int index) { 
     return RecipeGridCard(recipe: allRecipes[index]);
   },
  
 );
}

