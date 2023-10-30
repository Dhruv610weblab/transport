import 'package:get_storage/get_storage.dart';

class AppStorage {
  final box = GetStorage();
  Future saveToken(String token) async {
    await box.write('token', token);
  }

  dynamic getToken() {
    return box.read('token');
  }

  removeToken() {
    box.remove('token');
  }

  Future saveUserName(String username) async {
    await box.write('username', username);
  }

  dynamic getUserName() {
    return box.read('username');
  }

  removeUserName() {
    box.remove('username');
  }
}
