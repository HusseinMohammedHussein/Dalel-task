import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../l10n/l10n.dart';
import '../../routing/app_router.dart';

class OtpRequestScreen extends StatefulWidget {
  const OtpRequestScreen({
    super.key,
    this.initialViaEmail,
  });

  final bool? initialViaEmail;

  @override
  State<OtpRequestScreen> createState() => _OtpRequestScreenState();
}

class _OtpRequestScreenState extends State<OtpRequestScreen> {
  final _controller = TextEditingController();
  late bool _viaEmail;

  @override
  void initState() {
    super.initState();
    _viaEmail = widget.initialViaEmail ?? false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.requestOtp)),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.pagePadding,
          children: [
            Text(
              _viaEmail ? context.l10n.useYourEmail : context.l10n.useYourPhone,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              context.l10n.sendOtpHelp,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
            ),
            // const SizedBox(height: AppSpacing.xl),
            /*SegmentedButton<bool>(
              segments: [
                ButtonSegment(value: false, label: Text(context.l10n.phone)),
                ButtonSegment(value: true, label: Text(context.l10n.email)),
              ],
              selected: {_viaEmail},
              onSelectionChanged: (v) => setState(() => _viaEmail = v.first),
            ),*/
            const SizedBox(height: AppSpacing.lg),
            TextField(
              controller: _controller,
              keyboardType:
                  _viaEmail ? TextInputType.emailAddress : TextInputType.phone,
              decoration: InputDecoration(
                labelText:
                    _viaEmail ? context.l10n.email : context.l10n.phoneNumber,
                hintText: _viaEmail ? 'name@domain.com' : '+966 5X XXX XXXX',
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.otpVerify),
              child: Text(context.l10n.sendCode),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'By continuing, you agree to our Privacy Policy.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

