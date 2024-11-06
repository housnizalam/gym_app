import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color mishung({required List<ColorIntensity> colors, double opacity = 1}) {
    int intensitySumme = colors.fold(
        0, (previousValue, element) => previousValue + element.intensity);
    if (intensitySumme != 100) {
      throw Exception('The sum of the intensity must be 100');
    }
    int r = 0;
    int g = 0;
    int b = 0;
    for (var color in colors) {
      r += color.color.red * color.intensity;
      g += color.color.green * color.intensity;
      b += color.color.blue * color.intensity;
    }
    r = r ~/ 100;
    g = g ~/ 100;
    b = b ~/ 100;
    opacity = opacity < 0
        ? 0
        : opacity > 1
            ? 1
            : opacity;
    return Color.fromRGBO(r, g, b, opacity);
  }

  operator +(Color color) {
    return Color.fromRGBO(
      (red + color.red) ~/ 2,
      (green + color.green) ~/ 2,
      (blue + color.blue) ~/ 2,
      (opacity + color.opacity) / 2,
    );
  }
}

class ColorIntensity {
  Color color;
  int intensity;
  ColorIntensity(this.color, this.intensity);
}
