import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../data/hive_storage.dart';
import '../../../../../../data/secure_storage_service.dart';
import '../../../../../../data/hive_keys.dart';
import '../../../data/model/signup_response_model/signup_response_model.dart';
import '../../../domain/repos/craft_auth_repo.dart';
import '../../../data/model/craft_signup_body_model/craft_signup_body_model.dart';
import '../../../data/model/send_verification_otp_model/send_verification_otp_model.dart';
import 'craft_auth_state.dart';

@injectable
class CraftAuthCubit extends Cubit<CraftAuthState> {
  final CraftAuthRepo craftAuthRepo;

  CraftAuthCubit(this.craftAuthRepo) : super(const CraftAuthState.initial());

  static CraftAuthCubit get(context) =>
      BlocProvider.of<CraftAuthCubit>(context);

  // Form Fields
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Password visibility
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  // Date of Birth
  String? selectedMonth = "March";
  String? selectedDay = "5";

  String? selectedYear = "2010";

  // IDs
  String? backId;
  String? frontId;

  // OTP
  String otp = '';
  bool isFirstOtp = true;

  // Flags
  bool isLoaded = false;

  Future<void> sendVerificationOtp() async {
    emit(const CraftAuthState.otpLoading());

    final result = await craftAuthRepo.sendVerificationOtpModel(
      sendVerificationOtpModel: SendVerificationOtpModel(
        email: emailController.text,
        userName: userNameController.text,
      ),
    );

    result.fold(
      (l) => emit(CraftAuthState.signUpError(message: l.errorMsg)),
      (r) => emit(const CraftAuthState.otpSuccess()),
    );
  }

  Future<void> craftManSignUp() async {
    emit(const CraftAuthState.signUpLoading());

    final model = CraftSignupBodyModel(
      confirmPassword: passwordController.text,
      email: emailController.text,
      password: passwordController.text,
      userName: userNameController.text,
      otp: otp,
      idCardBackUrl: backId,
      idCardFrontUrl: frontId,
      dateOfBirth: _getFormattedBirthDate(
        year: selectedYear!,
        month: selectedMonth!,
        day: selectedDay!,
      ),
    );

    final result =
        await craftAuthRepo.craftManSignUp(craftSignupBodyModel: model);

    result.fold(
      (l) => emit(CraftAuthState.signUpError(message: l.errorMsg)),
      (r) async {
        await _storeUserCredentials(r);
        emit(const CraftAuthState.signUpSuccess());
      },
    );
  }

  String _getFormattedBirthDate({
    required String year,
    required String month,
    required String day,
  }) {
    return '$year-$month-$day';
  }

  Future<void> _storeUserCredentials(SignupResponseModel response) async {
    final storage = SecureStorageService();

    await storage.write(key: HiveKeys.accessToken, value: response.token ?? '');
    await storage.write(
        key: HiveKeys.refreshToken, value: response.refreshToken ?? '');

    HiveStorage.set(HiveKeys.id, response.id);
    HiveStorage.set(HiveKeys.email, response.email);
    HiveStorage.set(HiveKeys.username, response.userName);
  }
}
