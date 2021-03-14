import 'package:flame/game.dart';
import 'package:flame_svg/flame_svg.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends BaseGame {
  late Svg svgInstance;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    svgInstance.renderPosition(
      canvas,
      Vector2(100, 200),
      Vector2.all(300),
    );
  }

  @override
  Future<void> onLoad() async {
    svgInstance = await loadSvg('android.svg');
    final position = Vector2.all(100);
    final size = Vector2.all(100);
    final android = SvgComponent.fromSvg(position, size, svgInstance);
    add(android);
  }
}
