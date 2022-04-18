part of sprinkle;

abstract class Service<T> {
  Future<List<T>> getAllData();

  Future<T> dataBy({required int id});

  Future<bool> create(T value) async => false;

  Future<bool> update(T value) async => false;

  Future<bool> delete({required int id}) async => false;
}
