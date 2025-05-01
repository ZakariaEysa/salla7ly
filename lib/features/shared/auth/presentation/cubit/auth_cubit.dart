import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/features/shared/auth/domain/repos/auth_repo.dart';
import 'package:salla7ly/services/failure_service.dart';

import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_storage.dart';
import '../../data/model/sign_in_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final signInKey = GlobalKey<FormState>();
  AuthRepo authRepo;
  Future<void> signIn() async {
    emit(SignInLoadingState());
    final result = await authRepo.signIn(
        signInModel: SignInModel(
            email: emailController.text, password: passwordController.text));

    result.fold(
        (l) => emit(AuthErrorState(message: ServiceFailure(l.errorMsg))), (r) {
      HiveStorage.set(HiveKeys.accessToken, r.token);
      HiveStorage.set(HiveKeys.refreshToken, r.refreshToken);
      HiveStorage.set(HiveKeys.id, r.id);
      HiveStorage.set(HiveKeys.email, r.email);
      HiveStorage.set(HiveKeys.username, r.userName);
      emit(SignInSuccessState());
    });
  }

  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoadingState());
    final response = await authRepo.signInWithGoogle();

    response.fold(
      // (failure) => emit(GoogleAuthError(failure.errorMsg)),

      (failure) => emit(
        AuthErrorState(message: ServiceFailure(failure.errorMsg)),
      ),

      (user) => emit(GoogleAuthSuccessState()),
    );
  }
}
