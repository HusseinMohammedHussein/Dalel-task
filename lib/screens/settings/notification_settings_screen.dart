import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool _push = true;
  bool _email = false;
  bool _marketing = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.pagePadding,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: scheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: scheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preferences',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Control what you receive. UI-only for the test build.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SwitchListTile(
              value: _push,
              onChanged: (v) => setState(() => _push = v),
              title: const Text('Push notifications'),
              subtitle: const Text('Updates about favorites and nearby places'),
              secondary: const Icon(Icons.notifications_active_outlined),
            ),
            SwitchListTile(
              value: _email,
              onChanged: (v) => setState(() => _email = v),
              title: const Text('Email updates'),
              subtitle: const Text('Important account and product updates'),
              secondary: const Icon(Icons.email_outlined),
            ),
            SwitchListTile(
              value: _marketing,
              onChanged: (v) => setState(() => _marketing = v),
              title: const Text('Marketing'),
              subtitle: const Text('Promotions and recommendations'),
              secondary: const Icon(Icons.campaign_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

