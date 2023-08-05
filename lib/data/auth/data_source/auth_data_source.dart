import 'package:codeunion/data/auth/model/login_request_model.dart';
import 'package:codeunion/data/auth/model/login_response_model.dart';
import 'package:codeunion/data/core/client/api_client.dart';
import 'package:codeunion/data/core/constants/api_constants.dart';
import 'package:codeunion/data/user/model/user_model.dart';
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
    await Future.delayed(const Duration(seconds: 2), () => null);
    // final response = await _client.post<Map<String, dynamic>>(
    //   ApiConstants.login,
    //   data: loginRequest.toJson(),
    // );
    return const LoginResponseModel(
      user: UserModel(
        id: '1',
        nicName: 'Dk',
        email: 'dhruvin.vainsh02@gmail.com',
      ),
      tokens: TokensModel(
        refreshToken: 'random-token-value',
        accessToken: 'random-token-value',
      ),
    );
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
