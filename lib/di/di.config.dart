// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../data/data%20sources/remote_data_sources/auth_data_source_impl.dart'
    as _i171;
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/data_sources/remote_data_sources/remote_auth_data_source.dart'
    as _i867;
import '../domain/repositories/repositories/auth_repository.dart' as _i302;
import '../domain/use%20cases/register_use_case.dart' as _i550;
import '../features/ui/auth/register/cubit/register_screen_view_model.dart'
    as _i271;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i550.RegisterUseCase>(() =>
        _i550.RegisterUseCase(authRepository: gh<_i302.AuthRepository>()));
    gh.factory<_i867.RemoteAuthDataSource>(() =>
        _i171.RemoteAuthDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i271.RegisterScreenViewModel>(() =>
        _i271.RegisterScreenViewModel(
            registerUseCase: gh<_i550.RegisterUseCase>()));
    gh.factory<_i302.AuthRepository>(() =>
        AuthRepositoryImpl(authDataSource: gh<_i867.RemoteAuthDataSource>()));
    return this;
  }
}
