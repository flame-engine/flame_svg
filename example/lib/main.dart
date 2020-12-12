import 'package:flame/extensions/vector2.dart';
import 'package:flame/game.dart';
import 'package:flame_svg/flame_svg.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final game = MyGame();
  runApp(game.widget);
}

class MyGame extends BaseGame {
  Svg svgInstance;
  SvgComponent android;

  MyGame() {
    _start();
  }

  void _start() {
    svgInstance = Svg('android.svg');
    final size = Vector2.all(100);
    android = SvgComponent.fromSvg(size, svgInstance);
    android.x = 100;
    android.y = 100;

    add(android);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    svgInstance.renderPosition(canvas, Vector2(100, 200), Vector2.all(300));
  }
}
