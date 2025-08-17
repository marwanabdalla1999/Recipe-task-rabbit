import '../error/Failure.dart';

sealed class Result<T> {
  const Result();
}
class Ok<T> extends Result<T> { final T value; const Ok(this.value); }
class Err<T> extends Result<T> { final Failure failure; const Err(this.failure); }

extension ResultX<T> on Result<T> {
  bool get isOk => this is Ok<T>;
  T? get data => this is Ok<T> ? (this as Ok<T>).value : null;
}
