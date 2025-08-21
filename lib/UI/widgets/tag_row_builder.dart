import 'package:flutter/material.dart';
import 'package:mini_project_1/data/models/models.dart';

class TagRowBuilder extends StatelessWidget {
  final Recipe recipe;
  const TagRowBuilder({super.key , required this.recipe});

  @override
  Widget build(BuildContext context) {
    return _buildTagsRow(recipe.tags);
  }
}
 Widget _buildTagsRow(List<String> tags) {
    final tagsToShow = tags.take(3).toList();
    return Row(
      children: tagsToShow.map((tag) => _buildTag(tag)).toList(),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFF2B2E33),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 9),
      ),
    );
  }