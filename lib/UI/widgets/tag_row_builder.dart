import 'package:flutter/material.dart';
import 'package:mini_project_1/data/models/models.dart';

class TagRowBuilder extends StatelessWidget {

  final Recipe recipe;

  const TagRowBuilder({
    super.key , 
    required this.recipe
    });
 
  @override
  Widget build(BuildContext context) {
    final tags = recipe.tags;
    final tagsToShow = tags.take(3).toList();
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: tagsToShow.length,
        itemBuilder: (context, index) {
          final tag =tags[index];
          return Tag(label: tag);
        }
        
      ),
    );
  }
}

  class Tag extends StatelessWidget {
  const Tag({
    super.key, 
    required this.label
    });

    final String label;

  @override
  Widget build(BuildContext context) {
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
}