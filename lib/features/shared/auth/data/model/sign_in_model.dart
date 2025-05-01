import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
  final String? email;
  final String? password;

  const SignInModel({this.email, this.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [email, password];
}
