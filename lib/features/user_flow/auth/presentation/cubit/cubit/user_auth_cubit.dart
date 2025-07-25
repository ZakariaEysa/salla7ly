import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../data/hive_storage.dart';
import '../../../../../../data/secure_storage_service.dart';
import '../../../../../../data/hive_keys.dart';
import '../../../../../craft_man_flow/auth/data/model/send_verification_otp_model/send_verification_otp_model.dart';
import '../../../data/model/user_signup_body_model/user_signup_body_model.dart';
import '../../../domain/repos/user_auth_repo.dart';

import 'user_auth_state.dart'; // ✅ دي بقت Freezed دلوقتي

@injectable
class UserAuthCubit extends Cubit<UserAuthState> {
  final UserAuthRepo userAuthRepo;

  UserAuthCubit(this.userAuthRepo) : super(const UserAuthState.initial());

  static UserAuthCubit get(context) => BlocProvider.of<UserAuthCubit>(context);

  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final userFormKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isFirstOtp = true;

  bool isLoaded = false;
  String otp = "";

  Future<void> sendVerificationOtp() async {
    emit(const UserAuthState.otpLoading());

    final result = await userAuthRepo.sendVerificationOtpModel(
      sendVerificationOtpModel: SendVerificationOtpModel(
        email: emailController.text,
        userName: userNameController.text,
      ),
    );

    result.fold(
      (l) => emit(UserAuthState.signUpError(message: l.errorMsg)),
      (r) => emit(const UserAuthState.otpSuccess()),
    );
  }


    Future<void> resendVerificationOtp() async {
    emit(const UserAuthState.otpLoading());

    final result = await userAuthRepo.sendVerificationOtpModel(
      sendVerificationOtpModel: SendVerificationOtpModel(
        email: emailController.text,
        userName: userNameController.text,
      ),
    );

    result.fold(
      (l) => emit(UserAuthState.signUpError(message: l.errorMsg)),
      (r) => emit(const UserAuthState.resendOtpSuccess()),
    );
  }

  Future<void> userSignUp() async {
    emit(const UserAuthState.signUpLoading());

    final result = await userAuthRepo.userSignUp(
      userSignupBodyModel: UserSignupBodyModel(
        confirmPassword: passwordController.text,
        email: emailController.text,
        password: passwordController.text,
        userName: userNameController.text,
        otp: otp,
        // otp: "6209846",
      ),
    );

    result.fold(
      (l) => emit(UserAuthState.signUpError(message: l.errorMsg)),
      (r) async {
        final storage = SecureStorageService();

        await storage.write(key: HiveKeys.accessToken, value: r.token ?? "");
        await storage.write(
            key: HiveKeys.refreshToken, value: r.refreshToken ?? "");

        HiveStorage.set(HiveKeys.id, r.id);
        HiveStorage.set(HiveKeys.email, r.email);
        HiveStorage.set(HiveKeys.username, r.userName);

        emit(const UserAuthState.signUpSuccess());
      },
    );
  }
}
