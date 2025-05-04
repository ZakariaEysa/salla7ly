import 'package:dartz/dartz.dart';
import 'package:salla7ly/features/craft_man_flow/auth/presentation/views/craftman_sign_up_view.dart';
import '../../../../../services/failure_service.dart';
import '../../data/model/craft_signup_body_model.dart';
import '../../data/model/craft_response_model.dart';
import '../../data/model/send_verification_otp_model.dart';

abstract class CraftAuthRepo {
  Future<Either<FailureService, void>> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel});

  Future<Either<FailureService, CraftSignupResponseModel>> craftManSignUp(
      {required CraftSignupBodyModel craftSignupBodyModel});
  // Future<Either<FailureService, List<dynamic>>> getAllTransactions(
  //     {int limit = 10, int page = 1});
}
