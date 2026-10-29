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