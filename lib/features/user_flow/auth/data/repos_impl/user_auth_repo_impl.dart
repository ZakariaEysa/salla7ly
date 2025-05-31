import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../services/failure_service.dart';
import '../../../../craft_man_flow/auth/data/model/send_verification_otp_model.dart';
import '../../domain/repos/user_auth_repo.dart';
import '../remote_data_source/user_auth_remote_data_source.dart';

import '../../../../craft_man_flow/auth/data/model/signup_response_model.dart';
import '../../data/model/user_signup_body_model.dart';

@LazySingleton(as: UserAuthRepo)
class UserAuthRepoImpl implements UserAuthRepo {
  final UserAuthRemoteDataSource userAuthRemoteDataSource;

  UserAuthRepoImpl(this.userAuthRemoteDataSource);

  @override
  Future<Either<FailureService, void>> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel}) async {
    try {
      final result = await userAuthRemoteDataSource.sendVerificationOtpModel(
          sendVerificationOtpModel: sendVerificationOtpModel);

      return Right(result);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<FailureService, SignupResponseModel>> userSignUp(
      {required UserSignupBodyModel userSignupBodyModel}) async {
    try {
      final result = await userAuthRemoteDataSource.userSignUp(
          userSignupBodyModel: userSignupBodyModel);

      return Right(result);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
}
