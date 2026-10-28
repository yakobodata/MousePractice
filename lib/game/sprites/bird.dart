import 'dart:math';


import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:monkey_fly/game/monkey_fly_game.dart';
import 'package:monkey_fly/game/sprites/number_line.dart';


class Bird extends SpriteComponent with HasGameReference<MonkeyFlyGame>, CollisionCallbacks,TapCallbacks {
  Bird({required this.spritePath,}): speed = 500 + Random().nextDouble() * 400; // random speed between 250 and 650

  final String spritePath;
  final double speed; // ← each bird now has its own speed

  bool isHit = false; 
  double fallSpeed = 0; 
  int tappedBirds = 0;
  late TextComponent scoreText;
  
  late NumberLine numberLine;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(200);
    anchor = Anchor.center;
    add(CircleHitbox());
  }
  
  @override
  void onTapDown(TapDownEvent event) {
    if (isHit) return;         // already shot → ignore
    isHit = true;
    fallSpeed = 100;           // start falling
    game.increaseScore();      // increase the score / number line
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isHit) {
      // Falling down with gravity
      fallSpeed += 600 * dt;               // gravity
      // position.y += fallSpeed * dt;
      double newY = position.y + (dt * 400);

      // // Stop at the bottom of the screen
      // final bottomY = game.size.y - size.y / 2 - 20; // a bit above the very edge
      // if (position.y >= bottomY) {
      //   position.y = bottomY;
      //   fallSpeed = 0;
      // }
      if (newY > (game.size.y / 2) - (size.y / 2)) {
      newY = (game.size.y / 2) - (size.y / 2);
        }

    position.y = newY;
    } else {
      // Still flying upward
      position.y -= speed * dt;
    }
  }
  
  
  // // ——— This makes the bird disappear when tapped ———
  // @override
  // void onTapDown(TapDownEvent event) {  
  //   // increaseScore();   // this updates both the number and the number line

  //   // Remove the bird
  //   removeFromParent();

    
  // }

}

class BirdOne extends Bird {
  BirdOne() : super(spritePath: 'bird_1.png');
}

class BirdTwo extends Bird {
  BirdTwo() : super(spritePath: 'bird_2.png');
}

class BirdThree extends Bird {
  BirdThree() : super(spritePath: 'bird_3.png');
}

class BirdFour extends Bird {
  BirdFour() : super(spritePath: 'bird_4.png');
}

class BirdFive extends Bird {
  BirdFive() : super(spritePath: 'bird_5.png');
}