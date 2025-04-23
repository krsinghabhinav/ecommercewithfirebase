import 'package:get_storage/get_storage.dart';

class CustomLocalStorage {
  static final CustomLocalStorage _instance = CustomLocalStorage._internal();

  CustomLocalStorage._internal();

  factory CustomLocalStorage() {
    return _instance;
  }

  final _storage = GetStorage();

  //generic method to save data

  Future<void> savaData<T>(String key, T data) async {
    await _storage.write(key, data);
  }

  // generic method to read data
  Future<T> getData<T>(String key) async {
    return await _storage.read(key);
  }

  // generic method to delete data
  Future<void> deleteData(String key) async {
    await _storage.remove(key);
  }

  // generic method to clear all data
  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
