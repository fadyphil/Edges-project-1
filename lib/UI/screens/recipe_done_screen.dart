import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';
import 'package:mini_project_1/routes/app_router.dart';


@RoutePage()
class RecipeDoneScreen extends StatelessWidget {
  final Recipe recipe;
  final double timeTaken;
  const RecipeDoneScreen({super.key, required this.recipe, required this.timeTaken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Done', 
        style: TextStyle(color: Colors.white),),
      leading: IconButton(
        onPressed: (){
          context.router.popUntilRoot();
          context.router.navigate(HistoryRoute());
        }, 
        icon: Icon(Icons.arrow_back, color: Colors.white,))),
      body: Center(
        child: Text(
          'Recipe Done! in about ${(timeTaken/60).toInt()} minutes. ',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}