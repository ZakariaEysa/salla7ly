import 'dart:async';

import 'package:injectable/injectable.dart';
import '../../../../../core/Network/api_service.dart';
import '../../../../../core/Network/end_points.dart';
import '../model/send_verification_otp_model.dart';

import '../../../../../utils/app_logs.dart';
import '../model/craft_signup_body_model.dart';
import '../model/signup_response_model.dart';

abstract class CraftAuthRemoteDataSource {
  Future<void> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel});
  Future<SignupResponseModel> craftManSignUp(
      {required CraftSignupBodyModel craftSignupBodyModel});
}

@LazySingleton(as: CraftAuthRemoteDataSource)
class CraftAuthRemoteDataSourceImpl implements CraftAuthRemoteDataSource {
  CraftAuthRemoteDataSourceImpl(this.apiService);
  ApiService apiService;

  @override
  Future<void> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.sendVerificationOtp,
          body: sendVerificationOtpModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.successLog("success");
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
  Future<SignupResponseModel> craftManSignUp(
      {required CraftSignupBodyModel craftSignupBodyModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.craftmanSignUp,
          body: craftSignupBodyModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.successLog("success");
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
