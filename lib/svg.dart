import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flame/flame.dart';

class Svg {
  DrawableRoot svgRoot;
  Size size;

  Svg(String fileName) {
    Flame.assets.readFile(fileName).then((svgString) async {
      svgRoot = await svg.fromSvgString(svgString, svgString);
    });
  }

  /// Renders the svg on the [canvas] using the dimensions provided by [size]
  ///
  /// If not loaded, does nothing
  void render(Canvas canvas, Vector2 size) {
    if (!loaded) {
      return;
    }

    svgRoot.scaleCanvasToViewBox(canvas, size.toSize());
    svgRoot.draw(canvas, null);
  }

  /// Renders the svg on the [canvas] on the given [position] using the dimensions provided by [size]
  ///
  /// If not loaded, does nothing
  void renderPosition(
    Canvas canvas,
    Vector2 position,
    Vector2 size,
  ) {
    if (!loaded) {
      return;
    }

    canvas.save();
    canvas.translate(position.x, position.y);
    render(canvas, size);
    canvas.restore();
  }

  bool get loaded => svgRoot != null;
}
