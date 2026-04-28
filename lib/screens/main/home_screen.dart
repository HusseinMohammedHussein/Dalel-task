import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../l10n/l10n.dart';
import '../../repo/daleel_repository.dart';
import '../../routing/app_router.dart';
import '../../widgets/common/app_search_field.dart';
import '../../widgets/common/app_section_header.dart';
import '../../widgets/common/business_card.dart';
import '../../widgets/common/category_chip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _repo = const DaleelRepository();
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = _repo.getCategories();
    final featured = _repo.getFeaturedBusinesses();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appName),
        actions: [
          IconButton(
            tooltip: context.l10n.notifications,
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.notifications),
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.pagePadding,
          children: [
            AppSearchField(
              controller: _search,
              hintText: context.l10n.searchHintHome,
              onSubmitted: (q) =>
                  Navigator.of(context).pushNamed(AppRoutes.searchResults, arguments: q),
            ),
            const SizedBox(height: AppSpacing.xl),
            AppSectionHeader(
              title: context.l10n.categories,
              actionText: context.l10n.viewAll,
              onAction: () =>
                  Navigator.of(context).pushNamed(AppRoutes.categories),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final c in categories)
                  CategoryChip(
                    category: c,
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.businessesByCategory,
                      arguments: BusinessesListArgs(
                        categoryId: c.id,
                        categoryName: c.name,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            AppSectionHeader(title: context.l10n.featured),
            const SizedBox(height: AppSpacing.sm),
            Column(
              children: [
                for (final b in featured) ...[
                  BusinessCard(
                    business: b,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.businessDetails, arguments: b.id),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  const Icon(Icons.favorite_outline),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      context.l10n.yourFavorites,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.favorites),
                    child: Text(context.l10n.open),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              return;
            case 1:
              Navigator.of(context).pushReplacementNamed(AppRoutes.search);
              return;
            case 2:
              Navigator.of(context).pushReplacementNamed(AppRoutes.favorites);
              return;
            case 3:
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
              return;
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.favorite_outline), label: 'Favorites'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

