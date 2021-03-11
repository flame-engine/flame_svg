import 'package:flame/game.dart';
import 'package:flame_svg/flame_svg.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends BaseGame {
  Svg svgInstance;
  SvgComponent android;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    svgInstance?.renderPosition(
      canvas,
      Vector2(100, 200),
      Vector2.all(300),
    );
  }

  @override
  Future<void> onLoad() async {
    final size = Vector2.all(100);
    svgInstance = await loadSvg('android.svg');
    android = SvgComponent.fromSvg(size, svgInstance);
    android.x = 100;
    android.y = 100;
    add(android);
  }
}
