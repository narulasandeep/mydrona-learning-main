import 'package:dronalms/app/data/Services/auth_service.dart';
import 'package:dronalms/app/data/Services/storage.dart';
import 'package:dronalms/app/my_uitl/my_util.dart';
import 'package:dronalms/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late final AuthService authService;
  var isLogin = false.obs;
  var username = "".obs;
  var password = "".obs;

  @override
  void onInit() {
    super.onInit();
    authService = AuthService();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void isLoginValid() {
    if (username.value.isNotEmpty && password.value.isNotEmpty) {
      MyUtil.showMySnackbar("Logging In", "Please wait");
      loginAndSaveUser();
    } else {
      MyUtil.showMySnackbar("Please Validate", "Login and Password invalid");
    }
  }

  void loginAndSaveUser() async {
    await authService.login(username: username.trim(), password: password.trim()).then((userModel) {
      if (userModel != null) {
        print("====${userModel.token}==");
        var storage = Get.find<GetStorageService>();
        storage.token = userModel.token.toString();
        if (storage.token.isNotEmpty) {
          storage.isLoggedIn = true;
          Get.offAllNamed(Routes.LMS_DASHBOARD);
        }
      }
    });
  }
}
