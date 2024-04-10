import 'package:flutter/material.dart';

final List<Color> _colors = [
  Colors.deepPurple,
  Colors.blue,
  Colors.white,
  Colors.black,
  Colors.yellow,
  Colors.orange
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor <= _colors.length - 1,
            'selectedColor mustb be <= ${_colors.length} - 1');

  ThemeData getTheme() => ThemeData(colorSchemeSeed: _colors[selectedColor]);
}
