import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// un simple bool
final isDarkModeProvider = StateProvider<bool>((ref) => false);


final selectedColorProvider = StateProvider((ref) => 0); 