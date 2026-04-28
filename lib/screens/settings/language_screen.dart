import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_spacing.dart';
import '../../app/cubit/locale_cubit.dart';
import '../../l10n/l10n.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    final code = context.read<LocaleCubit>().state.locale?.languageCode;
    _selected = code ?? 'system';
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.language)),
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
                    context.l10n.chooseLanguage,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    context.l10n.localizationReady,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            RadioGroup<String>(
              groupValue: _selected,
              onChanged: (v) {
                final next = v ?? 'system';
                setState(() => _selected = next);
                context.read<LocaleCubit>().setLanguageCode(next);
              },
              child: Column(
                children: [
                  RadioListTile<String>(
                    value: 'system',
                    title: Text(context.l10n.system),
                    subtitle: Text(context.l10n.followDeviceLanguage),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: scheme.outlineVariant),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  RadioListTile<String>(
                    value: 'en',
                    title: Text(context.l10n.english),
                    subtitle: Text(context.l10n.ltr),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: scheme.outlineVariant),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  RadioListTile<String>(
                    value: 'ar',
                    title: Text(context.l10n.arabic),
                    subtitle: Text(context.l10n.rtl),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: scheme.outlineVariant),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

