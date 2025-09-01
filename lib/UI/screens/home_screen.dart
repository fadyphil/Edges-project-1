import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_1/UI/widgets/bottom_nav_bar.dart';
import 'package:mini_project_1/routes/app_router.dart';


@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController(
      createRectTween: _createRectTween,
    );
  }


  static RectTween _createRectTween(
    Rect? begin,
    Rect? end,
  ) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }


  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(

      routes:const [
        ExploreRoute(),
        FavouritesRoute(),
        HistoryRoute(),
      ],
      
      navigatorObservers: () => [_heroController],

      
      // The bottom navigation bar gets its state from the router.
      bottomNavigationBuilder: (context, tabsRouter) {
        return CustomBottomNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }
}