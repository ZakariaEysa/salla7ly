import 'dart:async';

import 'package:injectable/injectable.dart';
import '../../../../../core/Network/api_service.dart';
import '../../../../../core/Network/end_points.dart';

import '../../../../../utils/app_logs.dart';
import '../model/auth_response_model/auth_response_model.dart';
import '../model/google_sign_in_model/google_sign_in_model.dart';
import '../model/send_forget_password_model/send_forget_password_model.dart';
import '../model/sign_in_model/sign_in_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/validate_forget_password_otp_model/validate_forget_password_otp_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> validateForgetPasswordOtp(
      {required ValidateForgetPasswordOtpModel validateForgetPasswordOtpModel});
  Future<void> sendForgetPassword(
      {required SendForgetPasswordModel sendForgetPasswordModel});
  Future<void> changePassword({required SignInModel signInModel});

  Future<GoogleSignInModel> signInWithGoogle();

  Future<AuthResponseModel> googleSignIn(
      {required GoogleSignInModel googleSignInModel});

  Future<AuthResponseModel> signIn({required SignInModel signInModel});
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.apiService, this._auth, this._googleSignIn);
  ApiService apiService;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<void> validateForgetPasswordOtp(
      {required ValidateForgetPasswordOtpModel
          validateForgetPasswordOtpModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.validateForgetPasswordOtp,
          body: validateForgetPasswordOtpModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.successLog("success");
        AppLogs.infoLog(response.data.toString());
        // AppLogs.infoLog(AuthResponseModel.fromJson(response.data).toString());
        // return validateForgetPasswordOtpModel.fromJson(response.data);
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

  @override
  Future<void> sendForgetPassword(
      {required SendForgetPasswordModel sendForgetPasswordModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.sendForgetPasswordOtp,
          body: sendForgetPasswordModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.successLog("success");
        AppLogs.infoLog(response.data.toString());
        
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

  @override
  Future<void> changePassword({required SignInModel signInModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.resetPassword, body: signInModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.successLog("success");
        AppLogs.infoLog(response.data.toString());
        
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

  @override
  Future<AuthResponseModel> googleSignIn(
      {required GoogleSignInModel googleSignInModel}) async {
    try {
      final response = await apiService
          .postWithoutToken(endPoint: EndPoints.googleSignIn, body: {
        'email': googleSignInModel.email,
        // 'name': "${name?.trim()}1",
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.successLog("success");
        AppLogs.infoLog(response.data.toString());
        AppLogs.infoLog(AuthResponseModel.fromJson(response.data).toString());
        return AuthResponseModel.fromJson(response.data);
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

  @override
  Future<AuthResponseModel> signIn({required SignInModel signInModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.login, body: signInModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.successLog("success");
        AppLogs.infoLog(response.data.toString());
        AppLogs.infoLog(AuthResponseModel.fromJson(response.data).toString());
        return AuthResponseModel.fromJson(response.data);
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

  @override
  Future<GoogleSignInModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('User canceled the sign-in process');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final user = userCredential.user;

      if (user != null) {
     
        
      
        AppLogs.infoLog(user.toString());

        

        return GoogleSignInModel(
          name: user.displayName ?? 'Unknown',
          email: user.email ?? 'Unknown',
        );
      } else {
        throw Exception('Google sign-in failed');
      }
    } catch (e) {
      AppLogs.errorLog(e.toString());

      throw Exception('Error during Google sign-in: $e');
    }
  }
}
