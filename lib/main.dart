import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:monkey_fly/app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  //this is my entry point into the game
  runApp(const GameApp());
}