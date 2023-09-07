// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:codeunion/data/auth/data_source/auth_data_source.dart' as _i4;
import 'package:codeunion/data/auth/data_source/auth_local_data_source.dart'
    as _i9;
import 'package:codeunion/data/auth/repository/auth_repo_impl.dart' as _i11;
import 'package:codeunion/data/core/client/api_client.dart' as _i3;
import 'package:codeunion/data/core/local_db/local_db.dart' as _i12;
import 'package:codeunion/data/user/data_source/user_data_source.dart' as _i6;
import 'package:codeunion/data/user/repository/user_repository_impl.dart'
    as _i8;
import 'package:codeunion/domain/auth/repository/auth_repo.dart' as _i10;
import 'package:codeunion/domain/user/repository/user_repo.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $setUpLocator(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final localDB = _$LocalDB();
  gh.lazySingleton<_i3.ApiClient>(() => _i3.ApiClient());
  gh.factory<_i4.AuthDataSource>(
    () => _i4.AuthDataSourceIMPL(gh<_i3.ApiClient>()),
  );
  await gh.singletonAsync<_i5.SharedPreferences>(
    () => localDB.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i6.UserDataSource>(
    () => _i6.UserDataSourceIMPL(gh<_i3.ApiClient>()),
  );
  gh.factory<_i7.UserRepository>(() => _i8.UserRepoSitoryIMPL());
  gh.factory<_i9.AuthLocalDataSource>(
    () => _i9.AuthLocalDataSourceIMPL(gh<_i5.SharedPreferences>()),
  );
  gh.factory<_i10.AuthRepository>(
    () => _i11.AuthRepoIMPL(
      gh<_i4.AuthDataSource>(),
      gh<_i9.AuthLocalDataSource>(),
    ),
  );
  return getIt;
}

class _$LocalDB extends _i12.LocalDB {}
