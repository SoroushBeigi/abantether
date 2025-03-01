abstract class KeyValueLocalDataSource {
  Future<void> write<T>({required String key, required T value});
  Future<T?> read<T>({required String key});
  Future<void> delete(String key);
}