import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Singleton instance
  static final SecureStorageService _instance = SecureStorageService._internal();

  factory SecureStorageService() => _instance;

  SecureStorageService._internal();

  // Create storage instance
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Write data
  Future<void> write({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  // Read data
  Future<String?> read({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  // Delete a single key
  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  // Delete all keys
  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

  // Check if key exists
  Future<bool> containsKey({required String key}) async {
    return await _secureStorage.containsKey(key: key);
  }

  // Read all keys (optional)
  Future<Map<String, String>> readAll() async {
    return await _secureStorage.readAll();
  }
}
