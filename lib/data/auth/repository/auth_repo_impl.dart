import 'package:codeunion/data/auth/data_source/auth_data_source.dart';
import 'package:codeunion/data/auth/model/login_request_model.dart';
import 'package:codeunion/data/auth/model/login_response_model.dart';
import 'package:codeunion/domain/auth/entity/login_response.dart';
import 'package:codeunion/domain/auth/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
final class AuthRepoIMPL implements AuthRepository {
  const AuthRepoIMPL(this._authDataSource);
  final AuthDataSource _authDataSource;

  @override
  Future<LoginResponseEntity> login(String email, String password) async {
    final response =
        await _authDataSource.login(LoginRequestModel(email, password));
    return response;
  }

  @override
  Future<TokensModel> refresh(String accessToken, String refreshToken) {
    final response = _authDataSource.refresh(
      TokensModel(accessToken: accessToken, refreshToken: refreshToken),
    );
    return response;
  }
}
