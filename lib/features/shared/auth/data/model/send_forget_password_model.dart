import 'package:equatable/equatable.dart';

class SendForgetPasswordModel extends Equatable {
  final String? email;

  const SendForgetPasswordModel({this.email});

  factory SendForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return SendForgetPasswordModel(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
      };

  @override
  List<Object?> get props => [email];
}
