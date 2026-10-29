import 'dart:math';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:monkey_fly/game/sprites/bird.dart';
import 'package:monkey_fly/game/sprites/number_line.dart';

class MonkeyFlyGame extends FlameGame with HasCollisionDetection, TapCallbacks {
  int currentRoundShots = 0;          // birds shot in the current round
  List<int> allRoundScores = [0];     // score of every round
  late NumberLine numberLine;
  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    overlays.add('ScoreOverlay');
    overlays.add('TopLeftLogo');
    overlays.add('TopRightLogo');

    numberLine = NumberLine()
      ..position = Vector2(size.x / 2, 2000)
      ..anchor = Anchor.topCenter;
    add(numberLine);

    _spawnBirds();

    final nextRoundButton = ButtonComponent(
    button: RectangleComponent(
      size: Vector2(180, 55),
      paint: Paint()..color = const Color(0xFF2E7D32),
    ),
    position: Vector2(size.x / 2, size.y - 30),
    anchor: Anchor.bottomCenter,
    onPressed: startNewRound,
  );

  // Add the text AFTER creating the button
  nextRoundButton.add(
    TextComponent(
      text: 'Next Round',
      position: Vector2(90, 27.5), // center of the 180x55 button
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  add(nextRoundButton);
  }

  
  // void increaseScore() {
  //   currentRoundShots++;
  //   allRoundScores[allRoundScores.length - 1] = currentRoundShots;
  //   numberLine.updateRounds(allRoundScores);
  // }
  void increaseScore() {
    currentRoundShots++;
    allRoundScores[allRoundScores.length - 1] = currentRoundShots;
    numberLine.updateRounds(allRoundScores);

    overlays.remove('ScoreOverlay');
    overlays.add('ScoreOverlay');
  }

  void startNewRound() {
    // Save current round and start a new one
    allRoundScores.add(0);
    currentRoundShots = 0;

    // Remove old birds
    children.whereType<Bird>().toList().forEach((b) => b.removeFromParent());

    // Spawn new birds
    _spawnBirds();

    numberLine.updateRounds(allRoundScores);
  }

  void _spawnBirds() {
    final sprites = ['bird_1.png', 'bird_2.png', 'bird_3.png'];

    for (int i = 0; i < 8; i++) {
      final bird = Bird(spritePath: sprites[_random.nextInt(sprites.length)])
        ..position = Vector2(
          60 + _random.nextDouble() * (size.x - 120),
          size.y + 80 + _random.nextDouble() * 500,
        );
      add(bird);
    }
  }

  @override
  Color backgroundColor() {
    return Colors.green;
  }

  
}