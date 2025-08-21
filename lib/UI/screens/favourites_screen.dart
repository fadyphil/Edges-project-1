import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/UI/widgets/recipe_card.dart';
import 'package:mini_project_1/blocs/favourited/favourited_cubit.dart';
import 'package:mini_project_1/blocs/favourited/favourited_state.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

@RoutePage()
class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});


  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
          backgroundColor: const Color(0xFF181B21),
          centerTitle: true,
          elevation: 5,
        ),
        backgroundColor: const Color(0xFF0E1118),
        body: BlocSelector<FavouritedCubit, FavouritedState, Set<Recipe>>(
          selector: (state) => state.favouritedRecipes,
          builder: (context, favedSet) {
            if (favedSet.isEmpty){
              return const Center(child: Text('No favourites yet.', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)));
            }
            return ListView.builder(
            itemCount: favedSet.length,
            itemBuilder: (context, index) {
              final recipe = favedSet.toList()[index];
              return RecipeCard(recipe: recipe);
            }
                
          );
          }
        ),
      ) ;
       
      
  }
}