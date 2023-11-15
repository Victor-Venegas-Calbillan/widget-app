
import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.teal,
  Colors.yellow,
  Colors.purple,
  Colors.pink,
  Colors.orange,
  Colors.deepPurple,
];

class AppThemme {

  final int selecetedColor;

  AppThemme({
    this.selecetedColor = 0
  }): assert( selecetedColor >= 0, 'selecetedColor must be greater than 0'),
      assert( selecetedColor < colorList.length, 'selecetedColor must be less or equal than ${colorList.length -1 }');

  ThemeData getTheme() =>ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selecetedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );
  
}