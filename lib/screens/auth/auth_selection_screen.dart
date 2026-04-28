import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../l10n/l10n.dart';
import '../../routing/app_router.dart';

class AuthSelectionScreen extends StatefulWidget {
  const AuthSelectionScreen({super.key});

  @override
  State<AuthSelectionScreen> createState() => _AuthSelectionScreenState();
}

class _AuthSelectionScreenState extends State<AuthSelectionScreen> {
  bool _isSignup = false;
  bool _obscure = true;
  bool _loading = false;

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submitEmailAuth() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(milliseconds: 650));
    if (!mounted) return;
    setState(() => _loading = false);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.welcome),
        actions: [
          TextButton(
            onPressed: _loading ? null : () => setState(() => _isSignup = !_isSignup),
            child: Text(_isSignup ? context.l10n.login : context.l10n.signUp),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.pagePadding,
          children: [
            Text(
              _isSignup ? context.l10n.createAccount : context.l10n.signInToContinue,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              _isSignup
                  ? context.l10n.signupSubtitle
                  : context.l10n.loginSubtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: AppSpacing.xl),

            if (_isSignup) ...[
              TextField(
                controller: _name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: context.l10n.fullName,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],

            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: context.l10n.email,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _password,
              obscureText: _obscure,
              textInputAction: _isSignup ? TextInputAction.next : TextInputAction.done,
              decoration: InputDecoration(
                labelText: context.l10n.password,
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  tooltip: _obscure ? context.l10n.showPassword : context.l10n.hidePassword,
                  onPressed: () => setState(() => _obscure = !_obscure),
                  icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),

            if (_isSignup) ...[
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: _confirm,
                obscureText: _obscure,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: context.l10n.confirmPassword,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
              ),
            ],

            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: _loading ? null : _submitEmailAuth,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2.4),
                    )
                  : Text(_isSignup ? context.l10n.signUp : context.l10n.login),
            ),

            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(child: Divider(color: scheme.outlineVariant)),
                const SizedBox(width: AppSpacing.md),
                Text(
                  context.l10n.orContinueWith,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: Divider(color: scheme.outlineVariant)),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // OTP alternatives at the bottom of the screen
            FilledButton.icon(
              onPressed: _loading
                  ? null
                  : () => Navigator.of(context).pushNamed(
                        AppRoutes.otpRequest,
                        arguments: const OtpRequestArgs(viaEmail: false),
                      ),
              icon: const Icon(Icons.chat_bubble_outline),
              label: Text(context.l10n.continueWithWhatsApp),
            ),
/*            const SizedBox(height: AppSpacing.md),
            OutlinedButton.icon(
              onPressed: _loading
                  ? null
                  : () => Navigator.of(context).pushNamed(
                        AppRoutes.otpRequest,
                        arguments: const OtpRequestArgs(viaEmail: true),
                      ),
              icon: const Icon(Icons.mark_email_read_outlined),
              label: Text(context.l10n.requestOtpByEmail),
            ),*/
          ],
        ),
      ),
    );
  }
}

