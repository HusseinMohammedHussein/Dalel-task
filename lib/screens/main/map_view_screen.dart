import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../widgets/states/empty_state.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Map View')),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pagePadding,
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: scheme.outlineVariant),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.map_outlined,
                  size: 72,
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const Expanded(
                child: EmptyState(
                  title: 'Map UI only',
                  subtitle:
                      'This is a placeholder map container (no SDK integration).',
                  icon: Icons.location_on_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

