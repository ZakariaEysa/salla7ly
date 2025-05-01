import 'package:equatable/equatable.dart';

class GoogleSignInModel extends Equatable {
  final String? email;
  final String? name;

  const GoogleSignInModel({this.email, this.name});

  factory GoogleSignInModel.fromJson(Map<String, dynamic> json) => GoogleSignInModel(
        email: json['email'] as String?,
        name: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': name,
      };

  @override
  List<Object?> get props => [email, name];
}
