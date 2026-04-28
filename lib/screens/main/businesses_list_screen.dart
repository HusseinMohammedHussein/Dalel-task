import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../repo/daleel_repository.dart';
import '../../routing/app_router.dart';
import '../../widgets/common/business_card.dart';
import '../../widgets/states/empty_state.dart';

class BusinessesListScreen extends StatelessWidget {
  const BusinessesListScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final repo = const DaleelRepository();
    final businesses = repo.getBusinessesByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: SafeArea(
        child: businesses.isEmpty
            ? const EmptyState(
                title: 'No businesses yet',
                subtitle:
                    'This category is empty in dummy data. Try another category.',
                icon: Icons.storefront_outlined,
              )
            : ListView.separated(
                padding: AppSpacing.pagePadding,
                itemCount: businesses.length,
                separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
                itemBuilder: (context, i) {
                  final b = businesses[i];
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

