import 'package:curved_labeled_navigation_bar/curved_navigation_bar_type.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

const s = 0.2;

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double bottom;
  Color color;
  bool hasLabel;
  TextDirection textDirection;
  CurvedNavigationBarType type;

  NavCustomPainter({
    required double startingLoc,
    required int itemsLength,
    required this.color,
    required this.textDirection,
    this.hasLabel = false,
    required this.type,
  }) {
    final span = 1.0 / itemsLength;
    final l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
    bottom = hasLabel
        ? (Platform.isAndroid ? 0.55 : 0.45)
        : (Platform.isAndroid ? 0.6 : 0.5);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final isInwards = type.isInwards;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Calculate curve heights
    final curveOffset = isInwards ? size.height * 0.05 : -size.height * 0.05;
    final curveHeight =
        isInwards ? size.height * bottom : -size.height * bottom + 10;
    final centerHeight = isInwards ? curveHeight : curveHeight - 4;

    // Draw the path
    path.moveTo(0, 0);
    path.lineTo(size.width * (loc - 0.05), 0);

    // First curve
    path.cubicTo(
        size.width * (loc + s * 0.2), // control point 1 x
        curveOffset, // control point 1 y
        size.width * loc, // control point 2 x
        curveHeight, // control point 2 y
        size.width * (loc + s * 0.5), // end point x
        centerHeight // end point y
        );

    // Second curve
    path.cubicTo(
        size.width * (loc + s), // control point 1 x
        curveHeight, // control point 1 y
        size.width * (loc + s * 0.8), // control point 2 x
        curveOffset, // control point 2 y
        size.width * (loc + s + 0.05), // end point x
        0 // end point y
        );

    // Complete the shape
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
