import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/Network/api_service.dart';
import '../features/craft_man_flow/auth/data/remote_data_source/craft_auth_remote_data_source.dart';
import '../features/craft_man_flow/auth/data/repos_impl/craft_auth_repo_impl.dart';
import '../features/shared/auth/data/remote_data_source/auth_remote_data_source.dart';
import '../features/shared/auth/data/repos_impl/auth_repo_impl.dart';

final getIt = GetIt.instance;
void serviceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton<CraftAuthRemoteDataSourceImpl>(
      CraftAuthRemoteDataSourceImpl(getIt<ApiService>()));
  getIt.registerSingleton<CraftAuthRepoImpl>(
      CraftAuthRepoImpl(getIt<CraftAuthRemoteDataSourceImpl>()));

  getIt.registerSingleton<AuthRemoteDataSourceImpl>(AuthRemoteDataSourceImpl(
      getIt<ApiService>(), FirebaseAuth.instance, GoogleSignIn()));
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(getIt<AuthRemoteDataSourceImpl>()));
}
