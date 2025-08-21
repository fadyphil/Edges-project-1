import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project_1/UI/widgets/tag_row_builder.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/models.dart';
import 'package:mini_project_1/blocs/favourited/favourited_cubit.dart';
import 'package:mini_project_1/routes/app_router.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    // Use context.watch to listen for changes in the favorites state.
    // This will cause the card to rebuild when a recipe is favorited/unfavorited.
    final isFavorited = context.watch<FavouritedCubit>().state.favouritedRecipes.contains(recipe);
 
    final userfactor = context.watch<UserCubit>().getUsersFactor();


    return GestureDetector(
      onTap: () {
        context.router.push(
          RecipeDetailsRoute(recipe: recipe),
        );
      },
      child: Card(
        shadowColor: Colors.black.withOpacity(0.5),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        color: const Color(0xFF181B21), // A dark color from the Figma design
        elevation: 5,
        child: Row(
          
          children: [
      
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:  [
                    const Color(0xFF181B21),
                    const Color(0xFF181B21).withOpacity(0.7),
                    const Color(0xFF181B21).withOpacity(0.02)
                  ] ,
                  stops: const [0.02,0.15,1],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  )
              ),
              child: Image.asset(recipe.imagePath, width: 100, height: 100, fit: BoxFit.cover),
               
              ),
           
      
      
            // --- Main Content (Name, Tags, Info) ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                
                  crossAxisAlignment: CrossAxisAlignment.start,
                          
                  children: [
                    Text(
                      recipe.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Dynamically build the tags
                    TagRowBuilder(recipe: recipe),
                    const SizedBox(height: 16),
                    _buildInfoRow(recipe,userfactor),
                  ],
                ),
              ),
            ),
          
      
      
            // --- Favorite Button ---
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 35,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                children: [
                 GestureDetector(
                   onTap: () {
                     context.read<FavouritedCubit>().toggleFavourite(recipe);
                   },
                   child: Container(
                    padding: const EdgeInsets.all(4),
                    //  margin: EdgeInsets.only(bottom: 15),
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                        style: BorderStyle.solid,
                      )
                   
                     ),
                     child:  Center(
                      child: Icon(
                        isFavorited ? Icons.favorite : Icons.favorite_border_rounded,
                        color: isFavorited ? Colors.red : Colors.white70,
                        size: 16,
                      ),
                     )
                   ),
                 ),
                
                  Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: recipe.mealType.name=='meat'? 
                      const Color(0xFFD76261).withOpacity(0.1):
                      const Color(0xFF4ABC96).withOpacity(0.1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                       'assets/images/${recipe.mealType.name}_base.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildInfoRow(Recipe recipe , double userfactor) {
    return Row(
      children: [
        const Icon(Icons.timer_outlined, color: Colors.grey, size: 12),
        const SizedBox(width: 4),
        Text(
          '${(recipe.totalBaseTimeInSeconds / 60 * userfactor).ceil()} Mins',
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(width: 4),
        Text('-', style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(width: 4),
        const Icon(Icons.food_bank_outlined, color: Colors.grey, size: 12),
        const SizedBox(width: 4),
        Text(
          '${recipe.stepCount} Steps',
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}