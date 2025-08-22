import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_1/UI/screens/home_screen.dart';
import 'package:mini_project_1/UI/screens/explore_screen.dart';
import 'package:mini_project_1/UI/screens/favourites_screen.dart';
import 'package:mini_project_1/UI/screens/history_screen.dart';
import 'package:mini_project_1/UI/screens/onboarding_screen.dart';
import 'package:mini_project_1/UI/screens/recipe_details_screen.dart';
import 'package:mini_project_1/UI/screens/step_timer_screen.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter{ // <-- NO "extends" YET!
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', 
                  page: OnboardingRoute.page, 
                  initial: true,
                  ),
                  AutoRoute(
                        path: '/',
                        page: MainRoute.page,
                       
                            children: [
                            AutoRoute(path: 'explore', page: ExploreRoute.page, ),
                            AutoRoute(path: 'favourites', page: FavouritesRoute.page),
                            AutoRoute(path: 'history', page: HistoryRoute.page),
          ],
        ),
       
        AutoRoute(path: '/recipe-details', page: RecipeDetailsRoute.page),
        AutoRoute(path: '/step-timer', page: StepTimerRoute.page),
      ];
}