import 'package:dronalms/app/data/Services/storage.dart';
import 'package:dronalms/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(milliseconds: 1000), () {
      if (Get.find<GetStorageService>().isLoggedIn == true) {
        Get.offAllNamed(Routes.LMS_DASHBOARD);
      } else {
        Get.offAllNamed(Routes.AUTH);
      }
    });
  }
}
