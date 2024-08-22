import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<void> _setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? _getString(String key) => _prefs.getString(key);

  String organization() => _getString('organization') ?? '4d83953c-08a6-4f15-a01a-55a1e02ad07b';
}
