import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'key_value_data_source.dart';

@LazySingleton(as: KeyValueLocalDataSource)
class SecureStorageDataSource extends KeyValueLocalDataSource {
  final FlutterSecureStorage _storage;
  SecureStorageDataSource(this._storage);

  @override
  Future<void> write<T>({required String key, required T value}) async {
    if (value is String) {
      await _storage.write(key: key, value: value);
    } else {
      throw UnsupportedError('Type ${T.runtimeType} not supported');
    }
  }

  @override
  Future<T?> read<T>({required String key}) async {
    final value = await _storage.read(key: key);
    return _castValue<T>(value);
  }

  T? _castValue<T>(String? value) {
    if (T == String) return value as T?;
    throw UnsupportedError('Type $T not supported');
  }

  @override
  Future<void> delete(String key) => _storage.delete(key: key);
}


