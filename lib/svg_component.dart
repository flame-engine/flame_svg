import 'package:flame/sprite.dart';
import 'package:flame/components/component.dart';

import 'dart:ui';

import './svg.dart';

/// A [PositionComponent] that renders a single [Sprite] at the designated position, scaled to have the designated size and rotated to the designated angle.
///
/// This is the most commonly used child of [Component].
class SpriteComponent extends PositionComponent {
  Sprite sprite;
  Paint overridePaint;

  SpriteComponent();

  SpriteComponent.square(double size, String imagePath)
      : this.rectangle(size, size, imagePath);

  SpriteComponent.rectangle(double width, double height, String imagePath)
      : this.fromSprite(width, height, Sprite(imagePath));

  SpriteComponent.fromSprite(double width, double height, this.sprite) {
    this.width = width;
    this.height = height;
  }

  @override
  void render(Canvas canvas) {
    prepareCanvas(canvas);
    sprite.render(canvas,
        width: width, height: height, overridePaint: overridePaint);
  }

  @override
  bool loaded() {
    return sprite != null && sprite.loaded() && x != null && y != null;
  }
}

class SvgComponent extends PositionComponent {
  Svg svg;

  SvgComponent.fromSvg(double width, double height, this.svg) {
    this.width = width;
    this.height = height;
  }

  @override
  void render(Canvas canvas) {
    prepareCanvas(canvas);
    svg.render(canvas, width, height);
  }

  @override
  bool loaded() {
    return svg != null && svg.loaded() && x != null && y != null;
  }
}
