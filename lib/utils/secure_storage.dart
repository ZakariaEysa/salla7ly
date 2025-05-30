import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A secure storage service that provides encrypted storage functionality
/// using FlutterSecureStorage.
class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();
  late final FlutterSecureStorage _storage;

  /// Private constructor for singleton pattern
  SecureStorage._internal() {
    _storage = const FlutterSecureStorage();
  }

  /// Factory constructor to get the singleton instance
  factory SecureStorage() {
    return _instance;
  }

  /// Read a value from secure storage
  ///
  /// Returns null if the key doesn't exist
  /// Throws [Exception] if there's an error reading the value
  Future<String?> readValue({required String key}) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      throw Exception('Failed to read value for key: $key. Error: $e');
    }
  }

  /// Read all values from secure storage
  ///
  /// Returns an empty map if no values exist
  /// Throws [Exception] if there's an error reading the values
  Future<Map<String, String>> readAllValues() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      throw Exception('Failed to read all values. Error: $e');
    }
  }

  /// Delete a value from secure storage
  ///
  /// Throws [Exception] if there's an error deleting the value
  Future<void> deleteValue({required String key}) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw Exception('Failed to delete value for key: $key. Error: $e');
    }
  }

  /// Delete all values from secure storage
  ///
  /// Throws [Exception] if there's an error deleting all values
  Future<void> deleteAllValues() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw Exception('Failed to delete all values. Error: $e');
    }
  }

  /// Write a value to secure storage
  ///
  /// Throws [Exception] if there's an error writing the value
  Future<void> writeValue({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      throw Exception('Failed to write value for key: $key. Error: $e');
    }
  }
}
