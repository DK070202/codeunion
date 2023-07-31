import 'package:codeunion/data/auth/model/login_request_model.dart';
import 'package:codeunion/data/auth/model/login_response_model.dart';
import 'package:codeunion/data/core/client/api_client.dart';
import 'package:codeunion/data/core/constants/api_constants.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthDataSource {
  Future<LoginResponseModel> login(LoginRequestModel loginRequest);
  Future<TokensModel> refresh(TokensModel tokensModel);
}

@Injectable(as: AuthDataSource)
class AuthDataSourceIMPL implements AuthDataSource {
  const AuthDataSourceIMPL(this._client);
  final ApiClient _client;

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequest) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiConstants.login,
      data: loginRequest.toJson(),
    );
    return LoginResponseModel.fromJson(response!);
  }

  @override
  Future<TokensModel> refresh(TokensModel tokensModel) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApiConstants.refreshToken,
      data: tokensModel.toJson(),
    );
    return TokensModel.fromJson(response!);
  }
}
