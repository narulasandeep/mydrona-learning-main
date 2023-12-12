import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    return this;
  }

  // login Set Get
  bool get isLoggedIn => _runData.read('isLoggedIn') ?? false;
  set isLoggedIn(bool isLoggedIn) => _runData.write('isLoggedIn', isLoggedIn);

  //token Set Get
  String get token => _runData.read('token') ?? '';
  set token(String token) => _runData.write('token', token);

  void logout() {
    _runData.remove("runData");
    isLoggedIn = false;
  }
}
