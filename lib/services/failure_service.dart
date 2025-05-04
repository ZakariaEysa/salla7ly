abstract class FailureService {
  final String errorMsg;

  FailureService(String errorMsg)
      : errorMsg = errorMsg.replaceAll('Exception:', '').trim();
}

class ServiceFailure extends FailureService {
  ServiceFailure(super.errorMsg);
}
