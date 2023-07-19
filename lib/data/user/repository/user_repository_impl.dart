import 'package:codeunion/domain/user/entity/user_entity.dart';
import 'package:codeunion/domain/user/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepoSitoryIMPL implements UserRepository {
  @override
  Future<UserEntity> getProfile(String email, String password) {
    throw UnimplementedError();
  }
}
