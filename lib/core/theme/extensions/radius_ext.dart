import 'package:flutter/material.dart';

extension RadiusExt on double {
  /// All corner radius
  BorderRadius get r => BorderRadius.circular(this);

  /// Vertical (top & bottom)
  BorderRadius get rv => BorderRadius.vertical(
    top: Radius.circular(this),
    bottom: Radius.circular(this),
  );

  /// Horizontal (left & right)
  BorderRadius get rh => BorderRadius.horizontal(
    left: Radius.circular(this),
    right: Radius.circular(this),
  );

  /// Only top
  BorderRadius get rt => BorderRadius.only(
    topLeft: Radius.circular(this),
    topRight: Radius.circular(this),
  );

  /// Only bottom
  BorderRadius get rb => BorderRadius.only(
    bottomLeft: Radius.circular(this),
    bottomRight: Radius.circular(this),
  );

  /// Only left
  BorderRadius get rl => BorderRadius.only(
    topLeft: Radius.circular(this),
    bottomLeft: Radius.circular(this),
  );

  /// Only right
  BorderRadius get rr => BorderRadius.only(
    topRight: Radius.circular(this),
    bottomRight: Radius.circular(this),
  );

  /// Custom per-corner (advanced)
  BorderRadius only({
    double tl = 0,
    double tr = 0,
    double bl = 0,
    double br = 0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(tl),
      topRight: Radius.circular(tr),
      bottomLeft: Radius.circular(bl),
      bottomRight: Radius.circular(br),
    );
  }
}
