abstract class FailureService {
  final String errorMsg;

  FailureService(this.errorMsg);
}

class ServiceFailure extends FailureService {
  ServiceFailure(super.errorMsg);
}
