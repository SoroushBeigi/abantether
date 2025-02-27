sealed class Result<T> {
  const Result();

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(Failure failure) onError,
  }) {
    return switch (this) {
      Success<T>() => onSuccess((this as Success<T>).data),
      Error<T>() => onError((this as Error<T>).failure),
    };
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);
}

//Domain-level Failure, has nothing to do with http/api and has minimal/no coupling with data layer
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure() : super('Server error occurred');
}

class ClientFailure extends Failure {
  const ClientFailure() : super('Client error occurred');
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('Unknown error occurred');
}

class DatabaseFailure extends Failure {
  const DatabaseFailure() : super('Something went wrong with local database');
}