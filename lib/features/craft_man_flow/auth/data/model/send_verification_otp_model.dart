import 'package:equatable/equatable.dart';

class SendVerificationOtpModel extends Equatable {
  final String? userName;
  final String? email;

  const SendVerificationOtpModel({this.userName, this.email});

  factory SendVerificationOtpModel.fromJson(Map<String, dynamic> json) {
    return SendVerificationOtpModel(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
      };

  @override
  List<Object?> get props => [userName, email];
}
