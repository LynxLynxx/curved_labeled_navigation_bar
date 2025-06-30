import 'package:flutter/material.dart';

/// Example usage:
/// CurvedNavigationBarItem(
///   child: SvgPicture.asset('assets/icon.svg'),
///   label: 'SVG',
/// )
/// CurvedNavigationBarItem(
///   child: Icon(Icons.home),
///   label: 'Home',
/// )

class CurvedNavigationBarItem {
  /// The icon widget of [CurvedNavigationBarItem].
  /// Can be an [Icon], [SvgPicture], [Image], etc.
  final Widget child;

  /// Text of [CurvedNavigationBarItem].
  final String? label;

  /// TextStyle for [label].
  final TextStyle? labelStyle;

  const CurvedNavigationBarItem({
    required this.child,
    this.label,
    this.labelStyle,
  });
}
