// ignore: one_member_abstracts
abstract class UseCase<T, P> {
  Future<T> call(P params);
}
