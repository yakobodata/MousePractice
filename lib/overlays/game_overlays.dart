import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:monkey_fly/game/monkey_fly_game.dart';

Map<String, OverlayWidgetBuilder<MonkeyFlyGame>> gameOverlays = {
  'ScoreOverlay': (context, game) {
    return Positioned(
      // top: 30,
      bottom: 30,
      left: 20,
      // right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 70),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Birds shot: ${game.tappedBirds}',
            style: const TextStyle(
              fontSize: 100,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  },
};