// lib/ui/widgets/filter_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/blocs/explore/explore_cubit.dart';
import 'package:mini_project_1/blocs/explore/explore_state.dart';

// Helper class to hold just the data this widget needs.
// This is good practice for BlocSelector to ensure equality checks are efficient.
@immutable
class _FilterData {
  final Set<String> allTags;
  final Set<String> selectedTags;

  const _FilterData({required this.allTags, required this.selectedTags});

  // Override equality operator and hashCode for BlocSelector to work correctly.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _FilterData &&
          runtimeType == other.runtimeType &&
          allTags == other.allTags &&
          selectedTags == other.selectedTags;

  @override
  int get hashCode => allTags.hashCode ^ selectedTags.hashCode;
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // --- Drag Handle & Title ---
              Header(),

              // --- Scrollable Tag List (The part that uses BlocSelector) ---
              Expanded(
                child: BlocSelector<ExploreCubit, ExploreState, _FilterData?>(
                  selector: (state) {
                    // We select only the data we need. If the state is not 'loaded',
                    // we return null.
                    return state.mapOrNull(
                      loaded: (loadedState) => _FilterData(
                        allTags: loadedState.allTags,
                        selectedTags: loadedState.selectedTags,
                      ),
                    );
                  },
                  builder: (context, filterData) {
                    // Handle the case where the state isn't loaded yet
                    if (filterData == null) {
                      return const Center(child: Text("Loading filters..."));
                    }
                    
                    // If there are no tags at all, show a message.
                    if (filterData.allTags.isEmpty) {
                      return const Center(child: Text("No tags available to filter."));
                    }

                    return TagList(scrollController: scrollController, filterData: filterData);
                  },
                ),
              ),
              
              // --- Action Buttons ---
              ActionButtons(),
            ],
          ),
        );
      },
    );
  }

  // --- Helper Widgets ---
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Filter by Tags',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({
    super.key,
    required this.scrollController,
    required this.filterData,
  });

  final ScrollController scrollController;
  final _FilterData filterData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: filterData.allTags.map((tag) {
            final isSelected = filterData.selectedTags.contains(tag);
            return FilterChip(
              label: Text(tag),
              selected: isSelected,
              onSelected: (_) {
                context.read<ExploreCubit>().toggleTag(tag);
              },
              backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
              selectedColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.black : Colors.white70,
                fontWeight: FontWeight.w500,
              ),
              showCheckmark: true,
              side: BorderSide(
                width:0.3,
                color: Theme.of(context).colorScheme.onSecondary
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(top: 8),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => context.read<ExploreCubit>().clearFilters(),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white70,
                side: const BorderSide(color: Color(0xFF2B2E33)),
              ),
              child: const Text('Clear All'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}