import 'package:flame/components.dart';

import 'dart:ui';

import './svg.dart';

class SvgComponent extends PositionComponent {
  Svg svg;

  SvgComponent.fromSvg(Vector2 position, Vector2 size, this.svg) {
    this.position.setFrom(position);
    this.size.setFrom(size);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    svg.render(canvas, size);
  }
}
