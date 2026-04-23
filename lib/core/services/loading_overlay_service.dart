import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:flutter/material.dart';

class LoadingOverlayService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static OverlayEntry? _overlayEntry;

  static void show() {
    final overlay = AppNavigator.key.currentState?.overlay;

    if (overlay == null) return;

    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(builder: (_) => const _LoadingWidget());

    overlay.insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black45,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
