import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class NumberLine extends PositionComponent {
  // Constructor for the NumberLine component, allowing for optional position and currentValue parameters
  NumberLine({super.position, Null currentValue}) : super(size: Vector2(1500, 200));

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
  }
}