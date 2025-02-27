abstract class BaseUseCase<R, P> {
  Future<R> call(P arg);
}

abstract class BaseUseCaseNoArgs<R> {
  Future<R> call();
}
