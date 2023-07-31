import 'package:codeunion/data/core/client/api_client.dart';
import 'package:codeunion/data/core/constants/api_constants.dart';
import 'package:codeunion/data/user/model/user_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class UserDataSource {
  Future<UserModel> userModel();
}

@Injectable(as: UserDataSource)
class UserDataSourceIMPL implements UserDataSource {
  UserDataSourceIMPL(this._apiClient);

  final ApiClient _apiClient;
  @override
  Future<UserModel> userModel() async {
    final result =
        await _apiClient.get<Map<String, dynamic>>(ApiConstants.profile);
    return UserModel.fromJson(result!);
  }
}
