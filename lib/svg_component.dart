import 'package:flame/components/position_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flame/components/component.dart';

import 'dart:ui';

import './svg.dart';

class SvgComponent extends PositionComponent {
  Svg svg;

  SvgComponent.fromSvg(Vector2 size, this.svg) {
    this.size.setFrom(size);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    svg.render(canvas, size);
  }

  @override
  bool get loaded => svg != null && svg.loaded && x != null && y != null;
}
