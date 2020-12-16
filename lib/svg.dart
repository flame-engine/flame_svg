import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flame/flame.dart';

class Svg {
  DrawableRoot svgRoot;
  Size size;
  
  Svg(this.svgRoot);

  static Future<Svg> load(String fileName) async {
    final svgString = await Flame.assets.readFile(fileName);
    return Svg(await svg.fromSvgString(svgString, svgString));
  }

  /// Renders the svg on the [canvas] using the dimensions provided by [size]
  void render(Canvas canvas, Vector2 size) {
    svgRoot.scaleCanvasToViewBox(canvas, size.toSize());
    svgRoot.draw(canvas, null);
  }

  /// Renders the svg on the [canvas] on the given [position] using the dimensions provided by [size]
  void renderPosition(
    Canvas canvas,
    Vector2 position,
    Vector2 size,
  ) {
    canvas.save();
    canvas.translate(position.x, position.y);
    render(canvas, size);
    canvas.restore();
  }
}
