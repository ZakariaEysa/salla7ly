part of 'user_auth_cubit.dart';

sealed class UserAuthState extends Equatable {
  const UserAuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends UserAuthState {}

final class OtpLoadingState extends UserAuthState {}

final class OtpSuccessState extends UserAuthState {}

final class SignUpLoadingState extends UserAuthState {}

final class SignUpSuccessState extends UserAuthState {}

final class SignUpErrorState extends UserAuthState {
  final ServiceFailure message;
  const SignUpErrorState({required this.message});
}
