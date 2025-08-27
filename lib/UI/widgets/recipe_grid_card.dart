import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project_1/UI/widgets/info_row_builder.dart';
import 'package:mini_project_1/UI/widgets/tag_row_builder.dart';
import 'package:mini_project_1/blocs/favourited/favourited_cubit.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';
import 'package:mini_project_1/routes/app_router.dart';

class RecipeGridCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeGridCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    // Watch the FavouritedCubit to rebuild the card when the favorite state changes
    final isFavorited = context.watch<FavouritedCubit>().state.favouritedRecipes.contains(recipe);

    return GestureDetector(
      onTap: () {
        // Navigate to the details page on tap
        context.router.push(RecipeDetailsRoute(recipe: recipe));
      },
      child: Card(
        
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 5,
        // Using a Stack to layer the text and icon over the image
        child: Stack(
         
          children: [
            // --- Background Image with Gradient Overlay ---
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                   
                    
                    Theme.of(context).colorScheme.onSurface.withValues(alpha: .6),
                    Colors.transparent,
                    Theme.of(context).colorScheme.onSurface.withValues(alpha: .4),
                    Theme.of(context).colorScheme.onSurface.withValues(alpha: .7),
                    Theme.of(context).colorScheme.onSurface,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2,0.5,0.6,0.8,1]
                ),
              ),
              child: Image.asset(
                recipe.imagePath,
                width: double.infinity,
                height:150,
                fit: BoxFit.cover,
              ),
            ),
        
            // --- Recipe Name ---
            Positioned(
             top: 100,
              left: 0,
              right: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white, shadows: [
                            const Shadow(color: Colors.black, blurRadius: 10)
                          ]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      
                    ),
                    const SizedBox(height: 4),
                
                    TagRowBuilder(recipe: recipe),
                    const SizedBox(height: 18),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: info_row_builder(recipe: recipe, userfactor: context.watch<UserCubit>().getUsersFactor()))
                  ],
                ),
              ),
            ),
        
            // --- Favorite Button ---
            Positioned(
              top: 4,
              right: 4,
              left: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  Container(
                    padding: EdgeInsets.all(4),
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: recipe.mealType.name=='meat'? 
                    const Color(0xFFD76261).withValues(alpha: 0.4):
                    const Color(0xFF4ABC96).withValues(alpha:  0.4),
                    ),
                    child:SvgPicture.asset(
                      'assets/images/${recipe.mealType.name}_base.svg',
                      width: 16,
                      colorFilter: ColorFilter.mode(Colors.white70, BlendMode.srcIn) ,
                    )
                  ),
        
        
                  InkWell(
                    onTap: () {
                      context.read<FavouritedCubit>().toggleFavourite(recipe);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5, sigmaY: 5
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5
                            )
                          ),
                          child: Icon(
                            isFavorited ? Icons.favorite : Icons.favorite_border,
                            color: isFavorited ? Colors.redAccent : Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}