import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../repo/daleel_repository.dart';
import '../../routing/app_router.dart';
import '../../widgets/common/business_card.dart';
import '../../widgets/states/empty_state.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    final repo = const DaleelRepository();
    final results = repo.search(query);

    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: SafeArea(
        child: results.isEmpty
            ? const EmptyState(
                title: 'No results',
                subtitle: 'Try a different keyword or category.',
                icon: Icons.search_off_outlined,
              )
            : ListView.separated(
                padding: AppSpacing.pagePadding,
                itemCount: results.length,
                separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
                itemBuilder: (context, i) {
                  final b = results[i];
                  return BusinessCard(
                    business: b,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.businessDetails, arguments: b.id),
                  );
                },
              ),
      ),
    );
  }
}

