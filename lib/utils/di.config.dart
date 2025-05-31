// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:salla7ly/core/Network/api_service.dart' as _i505;
import 'package:salla7ly/features/craft_man_flow/auth/data/remote_data_source/craft_auth_remote_data_source.dart'
    as _i732;
import 'package:salla7ly/features/craft_man_flow/auth/data/repos_impl/craft_auth_repo_impl.dart'
    as _i461;
import 'package:salla7ly/features/craft_man_flow/auth/domain/repos/craft_auth_repo.dart'
    as _i477;
import 'package:salla7ly/features/craft_man_flow/auth/presentation/cubit/cubit/craft_auth_cubit.dart'
    as _i812;
import 'package:salla7ly/features/shared/auth/data/remote_data_source/auth_remote_data_source.dart'
    as _i284;
import 'package:salla7ly/features/shared/auth/data/repos_impl/auth_repo_impl.dart'
    as _i760;
import 'package:salla7ly/features/shared/auth/domain/repos/auth_repo.dart'
    as _i442;
import 'package:salla7ly/features/shared/auth/presentation/cubit/auth_cubit.dart'
    as _i714;
import 'package:salla7ly/features/user_flow/auth/data/remote_data_source/user_auth_remote_data_source.dart'
    as _i87;
import 'package:salla7ly/features/user_flow/auth/data/repos_impl/user_auth_repo_impl.dart'
    as _i193;
import 'package:salla7ly/features/user_flow/auth/domain/repos/user_auth_repo.dart'
    as _i369;
import 'package:salla7ly/features/user_flow/auth/presentation/cubit/cubit/user_auth_cubit.dart'
    as _i455;
import 'package:salla7ly/utils/register_module%20.dart' as _i1012;

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i505.ApiService>(
        () => _i505.ApiService(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i284.AuthRemoteDataSource>(
        () => _i284.AuthRemoteDataSourceImpl(
              gh<_i505.ApiService>(),
              gh<_i59.FirebaseAuth>(),
              gh<_i116.GoogleSignIn>(),
            ));
    gh.lazySingleton<_i442.AuthRepo>(
        () => _i760.AuthRepoImpl(gh<_i284.AuthRemoteDataSource>()));
    gh.factory<_i714.AuthCubit>(() => _i714.AuthCubit(gh<_i442.AuthRepo>()));
    gh.lazySingleton<_i732.CraftAuthRemoteDataSource>(
        () => _i732.CraftAuthRemoteDataSourceImpl(gh<_i505.ApiService>()));
    gh.lazySingleton<_i87.UserAuthRemoteDataSource>(
        () => _i87.UserAuthRemoteDataSourceImpl(gh<_i505.ApiService>()));
    gh.lazySingleton<_i369.UserAuthRepo>(
        () => _i193.UserAuthRepoImpl(gh<_i87.UserAuthRemoteDataSource>()));
    gh.lazySingleton<_i477.CraftAuthRepo>(
        () => _i461.CraftAuthRepoImpl(gh<_i732.CraftAuthRemoteDataSource>()));
    gh.factory<_i812.CraftAuthCubit>(
        () => _i812.CraftAuthCubit(gh<_i477.CraftAuthRepo>()));
    gh.factory<_i455.UserAuthCubit>(
        () => _i455.UserAuthCubit(gh<_i369.UserAuthRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i1012.RegisterModule {}
