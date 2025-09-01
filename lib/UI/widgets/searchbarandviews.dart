import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/UI/widgets/filterbottomsheet.dart';
import 'package:mini_project_1/blocs/explore/explore_cubit.dart';
import 'package:mini_project_1/blocs/explore/explore_state.dart';
import 'package:mini_project_1/data/models/enums.dart';

class SearchAndFilterBar extends StatefulWidget {
  const SearchAndFilterBar({super.key});

  @override
  State<SearchAndFilterBar> createState() => _SearchAndFilterBarState();
}

class _SearchAndFilterBarState extends State<SearchAndFilterBar> {

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: Row(
        children: [
          // --- Search Bar (Expanded) ---
          Expanded(
            child: TextField(
              
              onChanged: (query) {

                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 300),
                  (){
                    context.read<ExploreCubit>().searchChanged(query);
                  }
                );
                
              },
              
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16  ,vertical: 8),
                hintText: 'Search for a recipe...',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xFF888481)) ,
                prefixIcon: const Icon(Icons.search, 
                  color:Color(0xFF888481),
                  size: 16,
                  ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF2B2E33),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    width: 0.5,
                  )
                )
              ),
            ),
          ),
          const SizedBox(width: 4),

          // --- View Toggle Buttons ---
          ViewToggleButtons(
            selectedToggleStyle: _selectedToggleStyle, 
            unselectedToggleStyle: _unselectedToggleStyle, 
            ),

          const SizedBox(width: 4),

          // --- Filter Button ---
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context, 
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context){
                  return const FilterBottomSheet();
                }
                );
            },
            icon: const Icon(Icons.filter_list, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF181B21),
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the Grid/List view toggle
  ButtonStyle get _selectedToggleStyle {
    return IconButton.styleFrom(
      backgroundColor: Colors.white.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  ButtonStyle get _unselectedToggleStyle {
    return IconButton.styleFrom(
      backgroundColor: Colors.transparent,
    );
  }
}

class ViewToggleButtons extends StatelessWidget {
  const ViewToggleButtons({
    super.key,
    required ButtonStyle selectedToggleStyle,
    required ButtonStyle unselectedToggleStyle,
  }) : _selectedToggleStyle = selectedToggleStyle, _unselectedToggleStyle = unselectedToggleStyle;

  final ButtonStyle _selectedToggleStyle;
  final ButtonStyle _unselectedToggleStyle;

  @override
  Widget build(BuildContext context) {
        final currentViewType = context.watch<ExploreCubit>().state.mapOrNull(
      loaded: (state) => state.viewType,
    ) ?? ExploreViewType.list; 

    return Container(
      
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(12),

      ),
      child: Row(
        children: [
          // Grid View Button
          IconButton(
          
            onPressed: () {
              if (currentViewType != ExploreViewType.grid) {
                 context.read<ExploreCubit>().toggleViewType();
                 
              }
            },
            icon: Icon(
              Icons.grid_view_outlined,
              color: currentViewType == ExploreViewType.grid ? Colors.white : Colors.white54,
            ),
            style: currentViewType == ExploreViewType.grid
                ? _selectedToggleStyle
                : _unselectedToggleStyle,
          ),
          // List View Button
          IconButton(
            onPressed: () {
              if (currentViewType != ExploreViewType.list) {
                 context.read<ExploreCubit>().toggleViewType();
                
              }
            },
            icon: Icon(
              Icons.view_list_outlined,
              color: currentViewType == ExploreViewType.list ? Colors.white : Colors.white54,
            ),
            style: currentViewType == ExploreViewType.list
                ? _selectedToggleStyle
                : _unselectedToggleStyle,
          ),
        ],
      ),
    );
  }
}