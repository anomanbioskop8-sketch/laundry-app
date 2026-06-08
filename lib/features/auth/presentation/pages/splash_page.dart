import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // =========================
            // LOGO / ICON
            // =========================
            Container(
              padding: EdgeInsets.all(context.spacing.lg),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                borderRadius: context.radius.xl.r,
              ),
              child: Icon(
                Icons.local_laundry_service,
                size: 48,
                color: context.colors.primary,
              ),
            ),

            context.spacing.lg.h,

            // =========================
            // APP NAME
            // =========================
            Text(
              'Laundry App',
              style: context.text.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            context.spacing.sm.h,

            // =========================
            // SUBTITLE
            // =========================
            Text(
              'Menyiapkan aplikasi...',
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),

            context.spacing.xl.h,

            // =========================
            // LOADING
            // =========================
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: context.colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
