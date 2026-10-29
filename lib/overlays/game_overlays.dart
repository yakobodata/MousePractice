import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:monkey_fly/game/monkey_fly_game.dart';

Map<String, OverlayWidgetBuilder<MonkeyFlyGame>> gameOverlays = {
'ScoreOverlay': (context, game) {
  final total = game.allRoundScores.fold<int>(0, (sum, s) => sum + s);

  return Positioned(
    left: 20,
    bottom: 30,
    child: Text(
      'Score: $total',
      style: const TextStyle(
        fontSize: 26,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(color: Colors.black, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
    ),
  );
},
'TopLeftLogo': (BuildContext context, MonkeyFlyGame game) {
    return Stack(
      children: [
        Positioned(
          top: 20.0,
          left: 20.0,
          child: Image.asset(
            'assets/images/lions_logo.png', // Path to your image in pubspec.yaml
            width: 1500.0,                  // Set the width you want
            height: 800.0,                  // Set the height you want
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  },
'TopRightLogo': (BuildContext context, MonkeyFlyGame game) {
    return Stack(
      children: [
        Positioned(
          top: 20.0,
          right: 20.0,
          child: Image.asset(
            'assets/images/vativa_logo.png', // Path to your image in pubspec.yaml
            width: 1500.0,                  // Set the width you want
            height: 800.0,                  // Set the height you want
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  },
};

// Map<String, OverlayWidgetBuilder<MonkeyFlyGame>> gameOverlays = {
//   'ScoreOverlay': (context, game) {
//     return Positioned(
//       // top: 30,
//       bottom: 30,
//       left: 20,
//       // right: 0,
//       child: Center(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 70),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Text(
//             'Birds shot: ${game.currentRoundShots}',
//             style: const TextStyle(
//               fontSize: 100,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   },
// };