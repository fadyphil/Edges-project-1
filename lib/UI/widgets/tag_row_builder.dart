import 'package:flutter/material.dart';
import 'package:mini_project_1/data/models/models.dart';

class TagRowBuilder extends StatelessWidget {
  final Recipe recipe;
  const TagRowBuilder({super.key , required this.recipe});

  @override
  Widget build(BuildContext context) {
    return _buildTagsRow(recipe.tags, context);
  }
}
 Widget _buildTagsRow(List<String> tags,BuildContext context) {
    final tagsToShow = tags.take(3).toList();
    return Wrap(
      
      runSpacing: 4,
      children:
        tagsToShow.map((tag) => _buildTag(tag, context)).toList(),
      
    );
  }

  Widget _buildTag(String label, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall
      ),
    );
  }