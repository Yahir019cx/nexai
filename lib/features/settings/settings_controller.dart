import 'package:flutter/material.dart';
import 'package:nexai/core/services/settings_service.dart';

class SettingsController extends ChangeNotifier {
  SettingsController({SettingsService? settingsService})
    : _settingsService = settingsService ?? SettingsService() {
    _loadDisplayName();
  }

  final SettingsService _settingsService;
  String _displayName = 'Invitado';

  String get displayName => _displayName;

  Future<void> _loadDisplayName() async {
    final storedName = await _settingsService.loadDisplayName();
    if (storedName != null && storedName.isNotEmpty && storedName != _displayName) {
      _displayName = storedName;
      notifyListeners();
    }
  }

  Future<void> updateDisplayName(String name) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty || trimmed == _displayName) return;
    _displayName = trimmed;
    notifyListeners();
    await _settingsService.saveDisplayName(trimmed);
  }
}
