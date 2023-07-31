import 'package:codeunion/data/core/local_db/local_db_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> login(String accessToken, String refreshToken);
  Future<void> logout();
  bool isAuthenticated();
}

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceIMPL implements AuthLocalDataSource {
  AuthLocalDataSourceIMPL(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> login(String accessToken, String refreshToken) async {
    await _sharedPreferences.setString(LocalDBKeys.accessToken, accessToken);
    await _sharedPreferences.setString(LocalDBKeys.refreshToken, refreshToken);
    await _sharedPreferences.setBool(LocalDBKeys.isAuthenticated, true);
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.remove(LocalDBKeys.accessToken);
    await _sharedPreferences.remove(LocalDBKeys.refreshToken);
    await _sharedPreferences.setBool(LocalDBKeys.isAuthenticated, false);
  }

  @override
  bool isAuthenticated() {
    final isAuthenticated = _sharedPreferences.getBool(
      LocalDBKeys.isAuthenticated,
    );
    return isAuthenticated ?? false;
  }
}
