import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../repo/daleel_repository.dart';
import '../../routing/app_router.dart';
import '../../widgets/common/network_image_card.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = const DaleelRepository();
    final categories = repo.getCategories();

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: SafeArea(
        child: ListView.separated(
          padding: AppSpacing.pagePadding,
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
          itemBuilder: (context, i) {
            final c = categories[i];
            return InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                AppRoutes.businessesByCategory,
                arguments: BusinessesListArgs(
                  categoryId: c.id,
                  categoryName: c.name,
                ),
              ),
              borderRadius: BorderRadius.circular(18),
              child: Ink(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                child: Row(
                  children: [
                    NetworkImageCard(
                      imageUrl: c.heroImageUrl,
                      height: 86,
                      width: 110,
                      borderRadius: 18,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Explore top places and services',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Icon(Icons.chevron_right,
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    const SizedBox(width: AppSpacing.md),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

