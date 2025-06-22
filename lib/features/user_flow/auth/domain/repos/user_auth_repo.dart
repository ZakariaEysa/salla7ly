import 'package:dartz/dartz.dart';

import '../../../../../services/failure_service.dart';
import '../../../../craft_man_flow/auth/data/model/send_verification_otp_model/send_verification_otp_model.dart';
import '../../../../craft_man_flow/auth/data/model/signup_response_model/signup_response_model.dart';
import '../../data/model/user_signup_body_model/user_signup_body_model.dart';

abstract class UserAuthRepo {
  Future<Either<FailureService, void>> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel});

  Future<Either<FailureService, SignupResponseModel>> userSignUp(
      {required UserSignupBodyModel userSignupBodyModel});
}
