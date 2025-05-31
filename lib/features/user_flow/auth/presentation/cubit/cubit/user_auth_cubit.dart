import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/data/hive_storage.dart';
import 'package:salla7ly/services/failure_service.dart';

import '../../../../../../data/hive_keys.dart';
import '../../../../../craft_man_flow/auth/data/model/send_verification_otp_model.dart';
import '../../../data/model/user_signup_body_model.dart';
import '../../../domain/repos/user_auth_repo.dart';

part 'user_auth_state.dart';

@injectable
class UserAuthCubit extends Cubit<UserAuthState> {
  UserAuthRepo userAuthRepo;
  UserAuthCubit(this.userAuthRepo) : super(AuthInitial());
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
    emit(OtpLoadingState());
    final result = await userAuthRepo.sendVerificationOtpModel(
        sendVerificationOtpModel: SendVerificationOtpModel(
            email: emailController.text, userName: userNameController.text));
    result.fold(
        (l) => emit(SignUpErrorState(message: ServiceFailure(l.errorMsg))),
        (r) => emit(OtpSuccessState()));
  }

  Future<void> userSignUp() async {
    emit(SignUpLoadingState());
    final result = await userAuthRepo.userSignUp(
        userSignupBodyModel: UserSignupBodyModel(
      confirmPassword: passwordController.text,
      email: emailController.text,

      password: passwordController.text,
      userName: userNameController.text,
      otp: otp,
      // otp: "6209846",
    ));
    result.fold(
        (l) => emit(SignUpErrorState(message: ServiceFailure(l.errorMsg))),
        (r) {
      HiveStorage.set(HiveKeys.accessToken, r.token);
      HiveStorage.set(HiveKeys.refreshToken, r.refreshToken);
      HiveStorage.set(HiveKeys.id, r.id);
      HiveStorage.set(HiveKeys.email, r.email);
      HiveStorage.set(HiveKeys.username, r.userName);

      emit(SignUpSuccessState());
    });
  }
}
