// =============================================================================
// File        : loading_overlay_service.dart
// Path        : core/services/loading_overlay_service.dart
// Layer       : Core (UI Service)
// -----------------------------------------------------------------------------
// Global Loading Overlay Service.
//
// Responsibility:
// - Menampilkan loading overlay global tanpa BuildContext.
// - Digunakan oleh Cubit / Service layer (misalnya BaseActionCubit).
// - Mencegah multiple overlay muncul bersamaan.
//
// Notes:
// - Bergantung pada AppNavigator.key (NavigatorState).
// - Pastikan sudah terpasang di MaterialApp.
// - Overlay bersifat blocking (menutup seluruh UI).
// =============================================================================

import 'package:flutter/material.dart';
import 'app_navigator.dart';

class LoadingOverlayService {
  LoadingOverlayService._(); // ❌ prevent instantiation

  /// Internal overlay reference (singleton)
  static OverlayEntry? _overlayEntry;

  // ===========================================================================
  // PUBLIC API
  // ===========================================================================

  /// Menampilkan loading overlay
  static void show() {
    final overlayState = AppNavigator.navigatorKey.currentState?.overlay;

    // 🔒 Safety: Navigator belum siap
    if (overlayState == null) return;

    // 🔒 Prevent duplicate overlay
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(builder: (_) => const _LoadingOverlayWidget());

    overlayState.insert(_overlayEntry!);
  }

  /// Menyembunyikan loading overlay
  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  /// Cek apakah overlay sedang aktif
  static bool get isShowing => _overlayEntry != null;
}

// =============================================================================
// INTERNAL WIDGET
// ----------------------------------------------------------------------------
// Widget overlay loading global.
// Dipisahkan agar mudah di-custom di masa depan (branding / animation).
// =============================================================================

class _LoadingOverlayWidget extends StatelessWidget {
  const _LoadingOverlayWidget();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black45, // 🔥 overlay background
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
