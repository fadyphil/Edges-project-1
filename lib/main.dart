import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/blocs/explore/explore_cubit.dart';
import 'package:mini_project_1/blocs/favourited/favourited_cubit.dart';
import 'package:mini_project_1/blocs/navigation/navigation_cubit.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/repos/recipe_repo.dart';
import 'package:mini_project_1/routes/app_router.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final router = AppRouter();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => UserCubit()),
      BlocProvider(create: (_) => FavouritedCubit()),
      BlocProvider(create: (_) => ExploreCubit(recipeRepository: RecipeRepository())..loadRecipes()),
      BlocProvider(create: (_)=> NavigationCubit())
    ], 
    child: MaterialApp.router(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
    )
    );
  }
}


