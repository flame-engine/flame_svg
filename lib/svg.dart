import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flame/flame.dart';
import 'package:flame/position.dart';

class Svg {
  DrawableRoot svgRoot;
  Size size;

  Svg(String fileName) {
    Flame.assets.readFile(fileName).then((svgString) async {
      svgRoot = await svg.fromSvgString(svgString, svgString);
    });
  }

  /// Renders the svg on the [canvas] using the dimensions provided on [width] and [height]
  ///
  /// If not loaded, does nothing
  void render(Canvas canvas, double width, double height) {
    if (!loaded()) {
      return;
    }

    svgRoot.scaleCanvasToViewBox(canvas, Size(width, height));
    svgRoot.draw(canvas, null);
  }

  /// Renders the svg on the [canvas] on the given [position] using the dimensions provided on [width] and [height]
  ///
  /// If not loaded, does nothing
  void renderPosition(
    Canvas canvas,
    Position position,
    double width,
    double height,
  ) {
    if (!loaded()) {
      return;
    }

    canvas.save();
    canvas.translate(position.x, position.y);
    render(canvas, width, height);
    canvas.restore();
  }

  bool loaded() {
    return svgRoot != null;
  }
}
 
