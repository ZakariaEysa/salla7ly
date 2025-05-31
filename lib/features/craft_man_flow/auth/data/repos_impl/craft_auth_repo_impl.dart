import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../services/failure_service.dart';
import '../../domain/repos/craft_auth_repo.dart';
import '../model/craft_signup_body_model.dart';
import '../model/signup_response_model.dart';
import '../model/send_verification_otp_model.dart';
import '../remote_data_source/craft_auth_remote_data_source.dart';

@LazySingleton(as: CraftAuthRepo)
class CraftAuthRepoImpl implements CraftAuthRepo {
  final CraftAuthRemoteDataSource craftAuthRemoteDataSource;

  CraftAuthRepoImpl(this.craftAuthRemoteDataSource);

  @override
  // Future<Either<FailureService, List>> getAllTransactions(
  //     {int limit = 10, int page = 1}) async {
  //   try {
  //     final transactions = await craftAuthRemoteDataSource.getAllTransactions(
  //         limit: limit, page: page);

  //     return Right(transactions);
  //   } catch (e) {
  //     return Left(ServiceFailure(e.toString()));
  //   }
  // }
  Future<Either<FailureService, void>> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel}) async {
    try {
      final result = await craftAuthRemoteDataSource.sendVerificationOtpModel(
          sendVerificationOtpModel: sendVerificationOtpModel);

      return Right(result);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<FailureService, SignupResponseModel>> craftManSignUp(
      {required CraftSignupBodyModel craftSignupBodyModel}) async {
    try {
      final result = await craftAuthRemoteDataSource.craftManSignUp(
          craftSignupBodyModel: craftSignupBodyModel);

      return Right(result);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
}
