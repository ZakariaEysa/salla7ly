import 'package:dartz/dartz.dart';
import '../../../../../services/failure_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../model/auth_response_model.dart';
import '../model/google_sign_in_model.dart';
import '../model/sign_in_model.dart';
import '../remote_data_source/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<FailureService, GoogleSignInModel>> signInWithGoogle() async {
    try {
      final user = await authRemoteDataSource.signInWithGoogle();

      // await HiveStorage.saveGoogleUser(user);

      return Right(user);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
  @override
  Future<Either<FailureService, AuthResponseModel>> signIn(
      {required SignInModel signInModel}) async {
    try {
      final result =
          await authRemoteDataSource.signIn(signInModel: signInModel);

      return Right(result);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
}
