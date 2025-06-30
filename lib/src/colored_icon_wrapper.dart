import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that colors its child if possible (Icon, SvgPicture).
class ColoredIconWrapper extends StatelessWidget {
  final Widget child;
  final Color? color;

  const ColoredIconWrapper({Key? key, required this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (color == null) return child;
    // Handle Icon
    if (child is Icon) {
      final Icon icon = child as Icon;
      return Icon(
        icon.icon,
        size: icon.size,
        color: color,
        semanticLabel: icon.semanticLabel,
        textDirection: icon.textDirection,
      );
    }
    // Handle SvgPicture
    if (child is SvgPicture) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
        child: child,
      );
    }
    // Fallback: try IconTheme
    return IconTheme(
      data: IconThemeData(color: color),
      child: child,
    );
  }
}
