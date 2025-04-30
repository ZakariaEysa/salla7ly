import 'dart:async';

import 'package:dio/dio.dart';
import 'package:salla7ly/core/Network/api_service.dart';
import 'package:salla7ly/core/Network/end_points.dart';
import 'package:salla7ly/features/craft_man_flow/auth/data/model/send_verification_otp_model.dart';

import '../../../../../utils/app_logs.dart';
import '../model/craft_signup_body_model.dart';
import '../model/craft_signup_response_model.dart';

abstract class CraftAuthRemoteDataSource {
  Future<void> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel});
  Future<CraftSignupResponseModel> craftManSignUp(
      {required CraftSignupBodyModel craftSignupBodyModel});
}

class CraftAuthRemoteDataSourceImpl implements CraftAuthRemoteDataSource {
  CraftAuthRemoteDataSourceImpl(this.apiService);
  ApiService apiService;

  @override
  Future<void> sendVerificationOtpModel(
      {required SendVerificationOtpModel sendVerificationOtpModel}) async {
    try {
      AppLogs.scussessLog(sendVerificationOtpModel.toJson().toString());
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.sendVerificationOtp,
          body: sendVerificationOtpModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.scussessLog("success");
        // return response.data["results"] ?? []; // إرجاع المعاملات
      } else {
        AppLogs.scussessLog("Error fetching : ${response.data["errors"][1]}");
        throw Exception("Error fetching : ${response.data["errors"][1]}");
      }
    } catch (e) {
      AppLogs.scussessLog("Failed to fetch : ${e.toString()}");
    }
  }

  @override
  Future<CraftSignupResponseModel> craftManSignUp(
      {required CraftSignupBodyModel craftSignupBodyModel}) async {
    try {
      AppLogs.scussessLog(craftSignupBodyModel.toJson().toString());
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.craftmanSignUp,
          body: craftSignupBodyModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.scussessLog("success");
        return CraftSignupResponseModel.fromJson(response.data);
      } else {
        AppLogs.scussessLog("Error fetching : ${response.data["errors"][1]}");
        throw Exception("Error fetching : ${response.data["errors"][1]}");

        // return [];
      }
    } catch (e) {
      AppLogs.errorLog(e.toString());

      rethrow;
    }
  }
}
