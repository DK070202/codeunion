import 'package:codeunion/data/auth/data_source/auth_data_source.dart';
import 'package:codeunion/data/auth/data_source/auth_local_data_source.dart';
import 'package:codeunion/data/auth/model/login_request_model.dart';
import 'package:codeunion/data/auth/model/login_response_model.dart';
import 'package:codeunion/domain/auth/entity/login_response.dart';
import 'package:codeunion/domain/auth/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
final class AuthRepoIMPL implements AuthRepository {
  const AuthRepoIMPL(this._authDataSource, this._authLocalDataSource);
  final AuthDataSource _authDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  @override
  Future<LoginResponseEntity> login(String email, String password) async {
    final response = await _authDataSource.login(
      LoginRequestModel(email, password),
    );

    await _authLocalDataSource.login(
      response.tokens.accessToken,
      response.tokens.refreshToken,
    );

    return response;
  }

  @override
  Future<TokensModel> refresh(String accessToken, String refreshToken) async {
    final response = _authDataSource.refresh(
      TokensModel(accessToken: accessToken, refreshToken: refreshToken),
    );

    return response;
  }

  @override
  bool isAuthenticated() {
    return _authLocalDataSource.isAuthenticated();
  }

  @override
  Future<void> logout() async {
    await _authLocalDataSource.logout();
  }
}
