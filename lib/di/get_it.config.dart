// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:codeunion/data/auth/data_source/auth_data_source.dart' as _i4;
import 'package:codeunion/data/auth/repository/auth_repo_impl.dart' as _i6;
import 'package:codeunion/data/core/client/api_client.dart' as _i3;
import 'package:codeunion/data/user/data_source/user_data_source.dart' as _i7;
import 'package:codeunion/data/user/repository/user_repository_impl.dart'
    as _i9;
import 'package:codeunion/domain/auth/repository/auth_repo.dart' as _i5;
import 'package:codeunion/domain/user/repository/user_repo.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $setUpLocator(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ApiClient>(() => _i3.ApiClient());
  gh.lazySingleton<_i4.AuthDataSource>(
      () => _i4.AuthDataSourceIMPL(gh<_i3.ApiClient>()));
  gh.singleton<_i5.AuthRepository>(_i6.AuthRepoIMPL(gh<_i4.AuthDataSource>()));
  gh.lazySingleton<_i7.UserDataSource>(
      () => _i7.UserDataSourceIMPL(gh<_i3.ApiClient>()));
  gh.lazySingleton<_i8.UserRepository>(() => _i9.UserRepoSitoryIMPL());
  return getIt;
}
