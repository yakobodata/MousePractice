import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class NumberLine extends PositionComponent {
  NumberLine({super.position, Null currentValue}) : super(size: Vector2(1500, 200));

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final textPaint = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );

    // Main horizontal line
    canvas.drawLine(const Offset(20, 40), Offset(size.x - 20, 40), paint);

    // Ticks and numbers from 0 to 10
    for (int i = 0; i <= 10; i++) {
      final x = 20 + (i / 10) * (size.x - 40);

      // Tick
      canvas.drawLine(Offset(x, 30), Offset(x, 50), paint);

      // Number
      textPaint.render(canvas, '$i', Vector2(x - 6, 55));
    }
  }
}