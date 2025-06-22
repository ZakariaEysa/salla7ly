import 'package:dartz/dartz.dart';
import '../../../../../services/failure_service.dart';
import '../../data/model/craft_signup_body_model/craft_signup_body_model.dart';
import '../../data/model/signup_response_model/signup_response_model.dart';
import '../../data/model/send_verification_otp_model/send_verification_otp_model.dart';

abstract class CraftAuthRepo {
  Future<Either<FailureService, void>> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel});

  Future<Either<FailureService, SignupResponseModel>> craftManSignUp(
      {required CraftSignupBodyModel craftSignupBodyModel});
  // Future<Either<FailureService, List<dynamic>>> getAllTransactions(
  //     {int limit = 10, int page = 1});
}
