import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:monkey_fly/constants.dart';
import 'package:monkey_fly/game/monkey_fly_world.dart';

//this is my entry point into the game
class MonkeyFlyGame extends FlameGame {
  //this is my entry point into the game
  MonkeyFlyGame()
      : super(
        //so that the game world is rendered in the correct size and aspect ratio
        //this is the starting point of the game world
          world: MonkeyFlyWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  //this is my entry point into the game       
  int tappedBirds = 0;

  late TextComponent scoreText;  
  
  @override
  Color backgroundColor() {
    return Colors.green;
  }

  void increaseScore() {
  tappedBirds++;
  // If you have the number line:
  // numberLine.updateValue(tappedBirds);
}
}