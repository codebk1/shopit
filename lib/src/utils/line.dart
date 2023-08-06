import 'package:flutter/widgets.dart';

class Line extends CustomPainter {
  Line({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = size.height;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(Line oldDelegate) => false;
}
