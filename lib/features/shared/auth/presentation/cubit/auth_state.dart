part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
final class SignInLoadingState extends AuthState {}
final class SignInSuccessState extends AuthState {}
final class GoogleAuthLoadingState extends AuthState {}
final class GoogleAuthSuccessState extends AuthState {}
final class AuthErrorState extends AuthState {

  final ServiceFailure message;
  const AuthErrorState({required this.message});
}

