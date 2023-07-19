import 'package:codeunion/domain/auth/entity/token.dart';
import 'package:codeunion/domain/user/entity/user_entity.dart';

class LoginResponseEntity {
  const LoginResponseEntity({
    required this.user,
    required this.tokens,
  });

  final UserEntity user;
  final TokensEntity tokens;
}
