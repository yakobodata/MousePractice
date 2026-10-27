import 'dart:async';
import 'package:flame/components.dart';
import 'package:monkey_fly/constants.dart';
import 'package:monkey_fly/game/monkey_fly_game.dart';
import 'package:monkey_fly/game/sprites/bird.dart';
import 'package:monkey_fly/game/sprites/number_line.dart';




class MonkeyFlyWorld extends World with HasGameReference<MonkeyFlyGame>{
  // int tappedBirds = 0;

  // late TextComponent scoreText;
  late NumberLine numberLine;
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    // add(Player());
    add(BirdOne()..position = Vector2(2, (gameHeight / 2) + (gameWidth / 2)));
    add(BirdTwo()..position = Vector2(-playerSize * 2, (gameHeight / 2) + (gameWidth / 2)));
    add(BirdThree()..position = Vector2(playerSize * 2, (gameHeight / 2) + (gameWidth / 2)));
    
    // Add more instances of the same classes
    add(BirdOne()..position = Vector2(150, 1100));
    add(BirdTwo()..position = Vector2(320, 1300));
    add(BirdThree()..position = Vector2(480, 950));
    add(BirdOne()..position = Vector2(-400, 1400));
    add(BirdOne()..position = Vector2(-320, 1400));

  //       scoreText = TextComponent(
  //       text: 'Birds: 0',
  //       position: Vector2(0, 30),
  //       textRenderer: TextPaint(
  //         style: const TextStyle(
  //           fontSize: 24,
  //           color: Colors.white,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     );
  //     add(scoreText);
  // Just make the number line appear
      final numberLine = NumberLine(position: Vector2(2, 100) );
      numberLine.anchor = Anchor.topCenter; // important for proper centering
      add(numberLine);
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Bird>().forEach((bird) {
    bird.position.y -= dt * bird.speed; // ← uses the random speed of each bird
    });

    // Keep the text updated
    // scoreText.text = 'Birds: $tappedBirds';
  }

  // @override
  // Color backgroundColor() {
  //   return Colors.green;
  // }
  
}