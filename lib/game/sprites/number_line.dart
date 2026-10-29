import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class NumberLine extends PositionComponent {
  int currentValue = 0;

  NumberLine() : super(size: Vector2(5000, 1000)) {
    anchor = Anchor.topCenter;
  }

  void updateValue(int value) {
    currentValue = value.clamp(0, 20);
  }

  @override
  void render(Canvas canvas) {
    final whitePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10;

    final yellowPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final textPaint = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );

    const double startX = 30;
    final double endX = size.x - 30;
    const double mainLineY = 55;
    const double yellowLineY = 5; // just above the number line

    // ===== YELLOW LINE (from 0 to currentValue) =====
    if (currentValue > 0) {
      final double progressX = startX + (currentValue / 20) * (endX - startX);

      canvas.drawLine(
        const Offset(startX, yellowLineY),
        Offset(progressX, yellowLineY),
        yellowPaint,
      );
    }

    // White main number line
    canvas.drawLine(
      const Offset(startX, mainLineY),
      Offset(endX, mainLineY),
      whitePaint,
    );

    // Ticks and numbers 0 → 10
    for (int i = 0; i <= 20; i++) {
      final x = startX + (i / 20) * (endX - startX);

      // Tick
      canvas.drawLine(
        Offset(x, mainLineY - 12),
        Offset(x, mainLineY + 12),
        whitePaint,
      );

      // Number
      textPaint.render(canvas, '$i', Vector2(x - 7, mainLineY + 18));
    }
  }
}