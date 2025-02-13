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
import '../data/data sources/remote_data_sources/auth_data_source_impl.dart';
import '../data/data sources/remote_data_sources/home/remote_home_data_source_impl.dart';
import '../data/repositories/auth_repository_impl.dart' as _i74;
import '../data/repositories/home/home_repository_impl.dart';
import '../domain/repositories/data_sources/remote_data_sources/home/remote_home_data_source.dart'
    as _i993;
import '../domain/repositories/data_sources/remote_data_sources/remote_auth_data_source.dart'
    as _i867;
import '../domain/repositories/repositories/auth_repository.dart' as _i302;
import '../domain/repositories/repositories/home/home_repository.dart' as _i295;
import '../domain/use%20cases/brand_use_case.dart' as _i722;
import '../domain/use%20cases/category_use_case.dart' as _i967;
import '../domain/use%20cases/login_use_case.dart' as _i32;
import '../domain/use%20cases/product_use_case.dart' as _i149;
import '../domain/use%20cases/register_use_case.dart' as _i550;
import '../features/ui/auth/login/cubit/login_screen_view_model.dart' as _i286;
import '../features/ui/auth/register/cubit/register_screen_view_model.dart'
    as _i271;
import '../features/ui/pages/home_screen/tabs/category_tab/cubit/category_tab_view_model.dart'
    as _i653;
import '../features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i525;
import '../features/ui/pages/home_screen/tabs/home_tab/home_tab.dart' as _i836;

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
    gh.factory<_i836.HomeTab>(() => _i836.HomeTab());
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i525.HomeTabViewModel>(() => _i525.HomeTabViewModel(
          categoryUseCase: gh<_i967.CategoryUseCase>(),
          brandUseCase: gh<_i722.BrandUseCase>(),
        ));
    gh.factory<_i867.RemoteAuthDataSource>(
        () => RemoteAuthDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i993.RemoteHomeDataSource>(
        () => RemoteHomeDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i302.AuthRepository>(() => _i74.AuthRepositoryImpl(
        authDataSource: gh<_i867.RemoteAuthDataSource>()));
    gh.factory<_i295.HomeRepository>(() => HomeRepositoryImpl(
        remoteHomeDataSource: gh<_i993.RemoteHomeDataSource>()));
    gh.factory<_i32.LoginUseCase>(
        () => _i32.LoginUseCase(authRepository: gh<_i302.AuthRepository>()));
    gh.factory<_i550.RegisterUseCase>(() =>
        _i550.RegisterUseCase(authRepository: gh<_i302.AuthRepository>()));
    gh.factory<_i722.BrandUseCase>(
        () => _i722.BrandUseCase(homeRepository: gh<_i295.HomeRepository>()));
    gh.factory<_i967.CategoryUseCase>(
        () => _i967.CategoryUseCase(homeRepository: gh<_i295.HomeRepository>()));
    gh.factory<_i149.ProductUseCase>(
        () => _i149.ProductUseCase(homeRepository: gh<_i295.HomeRepository>()));
    gh.factory<_i271.RegisterScreenViewModel>(() =>
        _i271.RegisterScreenViewModel(
            registerUseCase: gh<_i550.RegisterUseCase>()));
    gh.factory<_i286.LoginScreenViewModel>(() =>
        _i286.LoginScreenViewModel(loginUseCase: gh<_i32.LoginUseCase>()));
    gh.factory<_i653.CategoryTabViewModel>(() =>
        _i653.CategoryTabViewModel(productUseCase: gh<_i149.ProductUseCase>()));
    return this;
  }
}
