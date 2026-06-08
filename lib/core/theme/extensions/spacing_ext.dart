import 'package:flutter/material.dart';

extension SpaceExt on double {
  //context.spacing.md.h
  SizedBox get h => SizedBox(height: this);
  SizedBox get w => SizedBox(width: this);
}
