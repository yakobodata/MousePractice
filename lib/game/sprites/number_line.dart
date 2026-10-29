import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class NumberLine extends PositionComponent {

  int? markedValue; // the correct number to highlight

  // Constructor for the NumberLine component, allowing for optional position and currentValue parameters
  NumberLine({super.position, Null currentValue}) : super(size: Vector2(4000, 200));

  void markValue(int value) {
    markedValue = value;
  }

  @override
  // The render method is responsible for drawing the number line on the canvas
  void render(Canvas canvas) {
    // Create a Paint object to define the appearance of the number line and ticks
    final paint = Paint()
      ..color = Colors.white
      // Set the stroke width and style for the number line and ticks
      ..strokeWidth = 4
      // Set the painting style to stroke, which means only the outline will be drawn
      ..style = PaintingStyle.stroke;

    // Create a TextPaint object to define the appearance of the numbers on the number line
    final textPaint = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );

    //
    // Main horizontal line
    canvas.drawLine(const Offset(20, 40), Offset(size.x - 20, 40), paint);

    // Ticks and numbers from 0 to 16
    for (int i = 0; i <= 16; i++) {
      final x = 20 + (i / 16) * (size.x - 40);

      // Tick
      canvas.drawLine(Offset(x, 30), Offset(x, 50), paint);

      // Number
      textPaint.render(canvas, '$i', Vector2(x - 6, 55));
    }

    // Draw the marker if we have a correct answer
    if (markedValue != null && markedValue! >= 0 && markedValue! <= 10) {
      // Calculate the x position for the marker based on the marked value
      final x = 30 + (markedValue! / 10) * (size.x - 60);
      // Draw a red circle as the marker for the correct answer
      final markerPaint = Paint()..color = Colors.redAccent;
      // Draw the marker circle at the calculated position
      canvas.drawCircle(Offset(x, 50), 14, markerPaint);

      // Vertical line
      canvas.drawLine(
        Offset(x, 20),
        Offset(x, 80),
        Paint()
          ..color = Colors.yellow
          ..strokeWidth = 4,
      );
    }
  }
}