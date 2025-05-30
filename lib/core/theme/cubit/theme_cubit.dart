import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cache/cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)) {
    _loadTheme();
  }

  static const String _themeKey = 'theme_mode';
  
  void _loadTheme() {
    final String? savedTheme = CacheHelper.getData(key: _themeKey);
    if (savedTheme != null) {
      final themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      emit(ThemeState(themeMode: themeMode));
    }
  }

  Future<void> toggleTheme() async {
    final isDark = state.themeMode == ThemeMode.dark;
    final newTheme = isDark ? 'light' : 'dark';
    await CacheHelper.saveData(key: _themeKey, value: newTheme);
    emit(ThemeState(themeMode: isDark ? ThemeMode.light : ThemeMode.dark));
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final themeString = mode == ThemeMode.dark ? 'dark' : 'light';
    await CacheHelper.saveData(key: _themeKey, value: themeString);
    emit(ThemeState(themeMode: mode));
  }
}
