import 'dart:async';

import 'package:injectable/injectable.dart';
import '../../../../../core/Network/api_service.dart';
import '../../../../../core/Network/end_points.dart';

import '../../../../../utils/app_logs.dart';
import '../../../../craft_man_flow/auth/data/model/send_verification_otp_model.dart';
import '../../../../craft_man_flow/auth/data/model/signup_response_model.dart';
import '../../data/model/user_signup_body_model.dart';

abstract class UserAuthRemoteDataSource {
  Future<void> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel});
  Future<SignupResponseModel> userSignUp(
      {required UserSignupBodyModel userSignupBodyModel});
}

@LazySingleton(as: UserAuthRemoteDataSource)
class UserAuthRemoteDataSourceImpl implements UserAuthRemoteDataSource {
  UserAuthRemoteDataSourceImpl(this.apiService);
  ApiService apiService;

  @override
  Future<void> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.sendVerificationOtp,
          body: sendVerificationOtpModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.scussessLog("success");
        // return response.data["results"] ?? []; // إرجاع المعاملات
      } else {
        AppLogs.errorLog(response.data.toString());
        AppLogs.errorLog(response.data);
        throw Exception(response.data);
      }
    } catch (e) {
      AppLogs.errorLog(e.toString());
      rethrow;
    }
  }

  @override
  Future<SignupResponseModel> userSignUp(
      {required UserSignupBodyModel userSignupBodyModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.userSignUp, body: userSignupBodyModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.scussessLog("success");
        return SignupResponseModel.fromJson(response.data);
      } else {
        AppLogs.errorLog(response.data.toString());

        AppLogs.errorLog(response.data);
        throw Exception(response.data);

        // return [];
      }
    } catch (e) {
      AppLogs.errorLog(e.toString());

      rethrow;
    }
  }
}
