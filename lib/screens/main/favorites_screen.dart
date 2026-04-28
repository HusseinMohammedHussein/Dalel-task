import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/cubit/favorites_cubit.dart';
import '../../constants/app_spacing.dart';
import '../../repo/daleel_repository.dart';
import '../../routing/app_router.dart';
import '../../widgets/common/business_card.dart';
import '../../widgets/states/empty_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: SafeArea(
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            final repo = const DaleelRepository();
            final favorites = state.businessIds
                .map((id) => repo.getBusinessById(id))
                .toList(growable: false);

            if (favorites.isEmpty) {
              return const EmptyState(
                title: 'No favorites yet',
                subtitle: 'Save businesses to access them quickly here.',
                icon: Icons.favorite_outline,
              );
            }

            return ListView.separated(
              padding: AppSpacing.pagePadding,
              itemCount: favorites.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, i) {
                final b = favorites[i];
                return BusinessCard(
                  business: b,
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.businessDetails, arguments: b.id),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
              return;
            case 1:
              Navigator.of(context).pushReplacementNamed(AppRoutes.search);
              return;
            case 2:
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

