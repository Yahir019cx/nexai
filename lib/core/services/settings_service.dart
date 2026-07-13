import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String _displayNameKey = 'display_name';

  Future<String?> loadDisplayName() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_displayNameKey);
  }

  Future<void> saveDisplayName(String name) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_displayNameKey, name);
  }
}
