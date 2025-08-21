import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/blocs/explore/explore_cubit.dart';
import 'package:mini_project_1/blocs/explore/explore_state.dart';
import 'package:mini_project_1/routes/app_router.dart';


class RandomPicker extends StatelessWidget {
  const RandomPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      color: const Color(0xFF181B21), // Matching the dark card theme
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
                color: Colors.white,
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
                children: const [
                  Text(
                    'Random Recipe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Don\'t know what to cook?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
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
                  loaded: (allRecipes, _, __) {
                    if (allRecipes.isNotEmpty) {
                      // Pick a random recipe
                      final random = Random();
                      final randomRecipe = allRecipes[random.nextInt(allRecipes.length)];
                      context.router.push(
                        RecipeDetailsRoute(recipe: randomRecipe),
                      );
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