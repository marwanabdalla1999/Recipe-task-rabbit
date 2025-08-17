
abstract class Failure {
  final String message;
  const Failure(this.message);
}
class NetworkFailure extends Failure { const NetworkFailure(String m): super(m); }
class ApiFailure extends Failure { const ApiFailure(String m): super(m); }
class UnknownFailure extends Failure { const UnknownFailure(String m): super(m); }
