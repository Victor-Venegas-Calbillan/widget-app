import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// listado de colores inmutables => valores inmutables
final colorListProvider = Provider((ref) => colorList);

// mantener el estado de la aplicacion 
final isDarkModeProvider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider((ref) => 0);

//un objeto de tipo AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Controller o Notifier 
class ThemeNotifier extends StateNotifier<AppTheme> {

  //estado = new AppTheme()
  ThemeNotifier(): super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selecetedColor: colorIndex);
  }
} 