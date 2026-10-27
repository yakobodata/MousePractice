import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:monkey_fly/constants.dart';
import 'package:monkey_fly/game/monkey_fly_game.dart';


class Player extends SpriteComponent with HasGameReference<MonkeyFlyGame> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("bird.png");
    size = Vector2.all(50);
    position = Vector2(0, (gameHeight / 2) + (size.y / 2));
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    double newY = (position.y) - (dt * 300);

    if (newY > (game.size.y / 2) - (size.y / 2)) {
      newY = (game.size.y / 2) - (size.y / 2);
    }

    position.y = newY;

    
  }
}