import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:monkey_fly/constants.dart';
import 'package:monkey_fly/game/monkey_fly_world.dart';
import 'package:monkey_fly/game/sprites/number_line.dart';

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

  late NumberLine numberLine;
  
  @override
  Color backgroundColor() {
    return Colors.green;
  }

  @override
  Future<void> onLoad() async {

    numberLine = NumberLine()
    ..position = Vector2(size.x / 2, 2000);

    add(numberLine);
    // Show the score overlay when the game starts
    overlays.add('ScoreOverlay');

    // ... your other code (birds, number line, etc.)
  }

  void increaseScore() {
    tappedBirds++;
    // Force the overlay to refresh
    overlays.remove('ScoreOverlay');
    overlays.add('ScoreOverlay');
    numberLine.updateValue(tappedBirds); // ← this moves the line
  }
    //   void increaseScore() {
    //   tappedBirds++;
    //   // If you have the number line:
    //   // numberLine.updateValue(tappedBirds);
    // }

}