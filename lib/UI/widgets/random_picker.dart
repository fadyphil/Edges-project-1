import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/UI/widgets/recipe_grid_card.dart';
import 'package:mini_project_1/blocs/explore/explore_cubit.dart';
import 'package:mini_project_1/blocs/explore/explore_state.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';
import 'package:mini_project_1/routes/app_router.dart';


class RandomPicker extends StatelessWidget {
  const RandomPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // --- Left Icon ---
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFF4ABC96),
              child: Icon(
                Icons.casino_outlined, // A 'dice' icon fits "Random" well
                size: 28,
              ),
            ),
            const SizedBox(width: 16),

            // --- Middle Text Section (Expanded) ---
            // We wrap the Column in an Expanded widget. This tells it to take up
            // all the available space between the icon and the button.
            Expanded(
              child: Column(
                // This aligns the text to the left.
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'Random Recipe',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Don\'t know what to cook?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            // --- Right Button ---
            FloatingActionButton(

              onPressed: () {
                // Get the cubit instance without listening
                final exploreCubit = context.read<ExploreCubit>();
                final currentState = exploreCubit.state;

                // Check if the state is 'loaded' before accessing recipes
                currentState.whenOrNull(
                  loaded: (allRecipes, _, __, ___, ____) {
                    if (allRecipes.isNotEmpty) {
                      // Pick a random recipe
                      final random = Random();
                      final randomRecipe = allRecipes[random.nextInt(allRecipes.length)];
                      final uniqueHeroPrefix = 'random_${randomRecipe.id}';
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        barrierColor: Colors.black.withAlpha(178), 
                        builder: (context){
                          return RandomizerDialog(
                            allRecipes: allRecipes,
                            finalRecipe: randomRecipe,
                            heroPrefix: uniqueHeroPrefix,
                            );
                        });
                      // context.router.push(
                      //   RecipeDetailsRoute(recipe: randomRecipe, heroprefix: ''),
                      // );
                    }
                  },
                );
              },
              // Style the button to be circular
              backgroundColor: Colors.white,
              
              child: const Icon(
                Icons.arrow_outward_rounded,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RandomizerDialog extends StatefulWidget {
  final List<Recipe> allRecipes;
  final Recipe finalRecipe;
  final String heroPrefix;

  const RandomizerDialog({
    super.key,
    required this.allRecipes,
    required this.finalRecipe,
    required this.heroPrefix,
  });

  @override
  State<RandomizerDialog> createState() => _RandomizerDialogState();
}

class _RandomizerDialogState extends State<RandomizerDialog> {
  late Timer _timer;
  late Recipe _currentRecipe;
  int _currentIndex = 0;
  bool _isLanded = false;

  // The total duration of the randomization effect
  final _animationDuration = const Duration(milliseconds: 1200);
  // How fast the items cycle at the beginning
  final _initialTickDuration = const Duration(milliseconds: 150);

  @override
  void initState() {
    super.initState();
    // Start with a random recipe
    _currentRecipe = widget.allRecipes[Random().nextInt(widget.allRecipes.length)];

    // This timer will rapidly change the displayed recipe
    _timer = Timer.periodic(_initialTickDuration, (timer) {
      setState(() {
        _currentIndex = Random().nextInt(widget.allRecipes.length);
        _currentRecipe = widget.allRecipes[_currentIndex];
      });
    });

    // This future will stop the animation and reveal the final recipe
    Future.delayed(_animationDuration, () {
      _timer.cancel();
      setState(() {
        _currentRecipe = widget.finalRecipe;
        _isLanded = true;
      });

      // After revealing, wait a moment then navigate
      Future.delayed(const Duration(milliseconds: 500), () {
        // Dismiss the dialog first
        if (mounted)Navigator.of(context).pop(); 
        // Then push the new route
        if(mounted) {
          context.router.push(
          RecipeDetailsRoute(recipe: widget.finalRecipe, heroprefix: widget.heroPrefix),
        );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We use a Dialog widget as the base for the modal effect
    return Dialog(
      backgroundColor: const Color(0xFF181B21),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: AbsorbPointer(
        absorbing: !_isLanded,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // The "Slot Machine" Image
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 80),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1.0), // Slides in from the bottom
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: SizedBox(
                  height: 200,
                  child: RecipeGridCard(recipe: _currentRecipe)),
              ),
        
              // The "Slot Machine" Text
              SizedBox(
                height: 30, // Give it a fixed height to prevent layout jumps
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 80),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Hero(
                    // IMPORTANT: The key changes to the final hero tag ONLY when landed
                    key: ValueKey<String>(_currentRecipe.name),
                    tag: _isLanded ? '${widget.heroPrefix}recipe_name_${widget.finalRecipe.id}' : '<dummy_name_tag>',
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        _currentRecipe.name,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}