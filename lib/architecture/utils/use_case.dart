abstract class UseCase<Type, Params> {
  Future<Type> call({required Params params});
}

abstract class UseCaseSimple<Type> {
  Future<Type> call();
}
