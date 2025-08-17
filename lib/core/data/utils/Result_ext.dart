import '../error/Failure.dart';
import 'Result.dart';

extension ResultX<T> on Result<T> {
  R when<R>({
    required R Function(T data) ok,
    required R Function(Failure failure) err,
  }) {
    if (this is Ok<T>) {
      return ok((this as Ok<T>).value);
    } else if (this is Err<T>) {
      return err((this as Err<T>).failure);
    }
    throw Exception('Invalid Result type');
  }
}
