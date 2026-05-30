// =============================================================================
// File        : subscription_page.dart
// Path        : lib/features/subscription/presentation/pages/subscription_page.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Halaman sementara ketika masa aktif company habis
// - Meminta user melakukan perpanjangan subscription
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.spacing.xl),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // =========================
              // ICON
              // =========================
              CircleAvatar(
                radius: 48,
                backgroundColor: context.colors.errorContainer,

                child: Icon(
                  Icons.workspace_premium_outlined,
                  size: 48,
                  color: context.colors.error,
                ),
              ),

              SizedBox(height: context.spacing.xl),

              // =========================
              // TITLE
              // =========================
              Text(
                'Masa Aktif Telah Berakhir',
                textAlign: TextAlign.center,
                style: context.text.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: context.spacing.md),

              // =========================
              // DESCRIPTION
              // =========================
              Text(
                'Silakan lakukan perpanjangan subscription untuk kembali menggunakan aplikasi laundry.',
                textAlign: TextAlign.center,
                style: context.text.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),

              SizedBox(height: context.spacing.xxl),

              // =========================
              // BUTTON
              // =========================
              SizedBox(
                width: double.infinity,

                child: FilledButton.icon(
                  onPressed: () {
                    // TODO:
                    // redirect whatsapp / payment / admin
                  },

                  icon: const Icon(Icons.payment_outlined),

                  label: const Text('Perpanjang Sekarang'),
                ),
              ),

              SizedBox(height: context.spacing.md),

              OutlinedButton.icon(
                onPressed: () {
                  // TODO:
                  // logout optional
                },

                icon: const Icon(AppIcons.logout),

                label: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
