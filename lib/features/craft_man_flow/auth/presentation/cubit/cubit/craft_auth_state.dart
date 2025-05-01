part of 'craft_auth_cubit.dart';

sealed class CraftAuthState extends Equatable {
  const CraftAuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends CraftAuthState {}

final class OtpLoadingState extends CraftAuthState {}

final class OtpSuccessState extends CraftAuthState {}

final class SignUpLoadingState extends CraftAuthState {}

final class SignUpSuccessState extends CraftAuthState {}

final class SignUpErrorState extends CraftAuthState {
  final ServiceFailure message;
  const SignUpErrorState({required this.message});
}
