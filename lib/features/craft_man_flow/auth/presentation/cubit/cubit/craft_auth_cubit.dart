import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../data/hive_storage.dart';
import '../../../domain/repos/craft_auth_repo.dart';
import '../../../../../../services/failure_service.dart';

import '../../../../../../data/hive_keys.dart';
import '../../../data/model/craft_signup_body_model.dart';
import '../../../data/model/send_verification_otp_model.dart';

part 'craft_auth_state.dart';

@injectable
class CraftAuthCubit extends Cubit<CraftAuthState> {
  CraftAuthRepo craftAuthRepo;
  CraftAuthCubit(this.craftAuthRepo) : super(AuthInitial());
  static CraftAuthCubit get(context) =>
      BlocProvider.of<CraftAuthCubit>(context);
  String? backId;
  String? frontId;
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String? selectedMonth = 'May';
  String? selectedDay = '12';
  String? selectedYear = '2002';
  bool isLoaded = false;
  String otp = "";
  bool isFirstOtp = true;

  Future<void> sendVerificationOtp() async {
    emit(OtpLoadingState());
    final result = await craftAuthRepo.sendVerificationOtpModel(
        sendVerificationOtpModel: SendVerificationOtpModel(
            email: emailController.text, userName: userNameController.text));
    result.fold(
        (l) => emit(SignUpErrorState(message: ServiceFailure(l.errorMsg))),
        (r) => emit(OtpSuccessState()));
  }

  Future<void> craftManSignUp() async {
    emit(SignUpLoadingState());
    final result = await craftAuthRepo.craftManSignUp(
        craftSignupBodyModel: CraftSignupBodyModel(
      confirmPassword: passwordController.text,
      email: emailController.text,
      idCardBackUrl: backId,
      idCardFrontUrl: frontId,
      password: passwordController.text,
      userName: userNameController.text,
      otp: otp,
      // otp: "6209846",
      dateOfBirth: '$selectedYear-$selectedMonth-$selectedDay',
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
