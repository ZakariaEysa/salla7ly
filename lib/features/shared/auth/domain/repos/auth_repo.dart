import 'package:dartz/dartz.dart';
import '../../../../../services/failure_service.dart';
import '../../data/model/auth_response_model.dart';
import '../../data/model/google_sign_in_model.dart';
import '../../data/model/sign_in_model.dart';

abstract class AuthRepo {
    Future<Either<FailureService, GoogleSignInModel>> signInWithGoogle();
    Future<Either<FailureService,AuthResponseModel> >googleSignIn(
      {required GoogleSignInModel googleSignInModel}) ;

  Future<Either<FailureService, AuthResponseModel>> signIn(
      {required SignInModel signInModel});
}
