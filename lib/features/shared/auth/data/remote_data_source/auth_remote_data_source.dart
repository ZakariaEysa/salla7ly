import 'dart:async';

import 'package:salla7ly/core/Network/api_service.dart';
import 'package:salla7ly/core/Network/end_points.dart';

import '../../../../../utils/app_logs.dart';
import '../model/auth_response_model.dart';
import '../model/google_sign_in_model.dart';
import '../model/sign_in_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<GoogleSignInModel> signInWithGoogle();
  Future<AuthResponseModel> googleSignIn(
      {required GoogleSignInModel googleSignInModel});

  Future<AuthResponseModel> signIn({required SignInModel signInModel});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.apiService, this._auth, this._googleSignIn);
  ApiService apiService;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<AuthResponseModel> googleSignIn(
      {required GoogleSignInModel googleSignInModel}) async {
    try {
      final response = await apiService.postWithoutToken(
          endPoint: EndPoints.googleSignIn, body: googleSignInModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogs.scussessLog("success");
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
        AppLogs.scussessLog("success");
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
        // if (HiveStorage.get(HiveKeys.role) == null) {
        //   HiveStorage.set(
        //     HiveKeys.role,
        //     Role.google.toString(),
        //   );
        // }
        AppLogs.infoLog(user.toString());

        // AppLogs.infoLog(GoogleUserModel.fromFirebaseUser(user).toString());
        // AppLogs.debugLog(GoogleUserModel.fromFirebaseUser(user).toString());

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
