import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class NumberLine extends PositionComponent {
  List<int> roundScores = [];

  NumberLine() : super(size: Vector2(5000, 2000)) {
    anchor = Anchor.topCenter;
  }

  void updateRounds(List<int> scores) {
    roundScores = List.from(scores);
  }

  @override
  void render(Canvas canvas) {
    final whitePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10;

    final textPaint = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );

    const double startX = 30;
    final double endX = size.x - 30;
    const double mainLineY = 160;
    final double totalWidth = endX - startX;

    final colors = [
      Colors.yellow,
      Colors.orange,
      Colors.lightGreenAccent,
      Colors.cyan,
      Colors.pinkAccent,
    ];

    double currentStartX = startX;

    for (int r = 0; r < roundScores.length; r++) {
      final score = roundScores[r].clamp(0, 40);
      if (score <= 0) continue;

      final double segmentWidth = (score / 40) * totalWidth;
      final double currentEndX = (currentStartX + segmentWidth).clamp(startX, endX);

      // Different Y for each round
      final double y = 30.0 + (r * 28);

      final paint = Paint()
        ..color = colors[r % colors.length]
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(
        Offset(currentStartX, y),
        Offset(currentEndX, y),
        paint,
      );

      // Next line starts where this one ended (in X)
      currentStartX = currentEndX;
    }

    // Main white number line
    canvas.drawLine(
      Offset(startX, mainLineY),
      Offset(endX, mainLineY),
      whitePaint,
    );

    // Numbers 0 → 20
    for (int i = 0; i <= 40; i++) {
      final x = startX + (i / 40) * totalWidth;

      canvas.drawLine(
        Offset(x, mainLineY - 12),
        Offset(x, mainLineY + 12),
        whitePaint,
      );

      textPaint.render(canvas, '$i', Vector2(x - 7, mainLineY + 18));
    }
  }
}