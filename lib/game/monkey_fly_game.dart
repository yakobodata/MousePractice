import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:monkey_fly/constants.dart';
import 'package:monkey_fly/game/monkey_fly_world.dart';

class MonkeyFlyGame extends FlameGame {
  MonkeyFlyGame()
      : super(
          world: MonkeyFlyWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );
  int tappedBirds = 0;

  late TextComponent scoreText;  
  
  @override
  Color backgroundColor() {
    return Colors.green;
  }
}