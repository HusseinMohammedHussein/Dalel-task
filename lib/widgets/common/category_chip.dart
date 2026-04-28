import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.category,
    required this.onTap,
  });

  final Category category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onTap,
      label: Text(category.name),
      avatar: const Icon(Icons.category_outlined, size: 18),
    );
  }
}

