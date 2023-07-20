import 'package:codeunion/domain/user/entity/user_entity.dart';

abstract interface class UserRepository {
  const UserRepository();
  Future<UserEntity> getProfile(
    String email,
    String password,
  );
}
