import 'package:flutter/material.dart';
import 'package:nexai/core/services/theme_service.dart';

class ThemeController extends ChangeNotifier {
  ThemeController({ThemeService? themeService})
    : _themeService = themeService ?? ThemeService() {
    _loadPersistedThemeMode();
  }

  final ThemeService _themeService;

  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  Future<void> _loadPersistedThemeMode() async {
    final persistedThemeMode = await _themeService.loadThemeMode();
    if (persistedThemeMode != _themeMode) {
      _themeMode = persistedThemeMode;
      notifyListeners();
    }
  }

  Future<void> toggleTheme() async {
    _themeMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
    await _themeService.saveThemeMode(_themeMode);
  }
}
