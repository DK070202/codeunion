import 'package:codeunion/domain/auth/entity/login_response.dart';
import 'package:codeunion/domain/auth/entity/token.dart';

abstract class AuthRepository {
  const AuthRepository();
  Future<LoginResponseEntity> login(String email, String password);
  Future<TokensEntity> refresh(String accessToken, String refreshToken);
  Future<void> logout();
  bool isAuthenticated();
}
