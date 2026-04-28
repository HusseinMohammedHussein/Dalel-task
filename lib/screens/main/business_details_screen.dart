import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_spacing.dart';
import '../../app/cubit/favorites_cubit.dart';
import '../../repo/daleel_repository.dart';
import '../../widgets/common/network_image_card.dart';

class BusinessDetailsScreen extends StatefulWidget {
  const BusinessDetailsScreen({
    super.key,
    required this.businessId,
  });

  final String businessId;

  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final repo = const DaleelRepository();
    final b = repo.getBusinessById(widget.businessId);
    final scheme = Theme.of(context).colorScheme;
    final fav = context.watch<FavoritesCubit>().state.isFavorite(b.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(b.name),
        actions: [
          IconButton(
            tooltip: fav ? 'Remove from favorites' : 'Add to favorites',
            onPressed: () => context.read<FavoritesCubit>().toggle(b.id),
            icon: Icon(fav ? Icons.favorite : Icons.favorite_outline),
          ),
          IconButton(
            tooltip: 'Share',
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.pagePadding,
          children: [
            NetworkImageCard(
              imageUrl: b.imageUrls.first,
              height: 190,
              borderRadius: 22,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.all(AppSpacing.md),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded, size: 18, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        '${b.rating.toStringAsFixed(1)} • ${b.ratingCount} ratings',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              b.locationText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'About',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              b.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final t in b.tags) Chip(label: Text(t)),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Gallery',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: 92,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => NetworkImageCard(
                  imageUrl: b.imageUrls[i % b.imageUrls.length],
                  height: 92,
                  width: 120,
                  borderRadius: 16,
                ),
                separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
                itemCount: 6,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.sm,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.call_outlined),
          label: Text('Contact • ${b.phone}'),
        ),
      ),
    );
  }
}

