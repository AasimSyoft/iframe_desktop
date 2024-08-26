import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<void> _setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? _getString(String key) => _prefs.getString(key);

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async => await _prefs.clear();

  String organization() => _getString('organization') ?? '';
  Future<void> setOrganization(String value) async =>
      await _setString('organization', value);

  String? get token => _getString('token');
  Future<void> setToken(String value) async => await _setString('token', value);
}
