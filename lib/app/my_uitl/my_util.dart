import 'package:dronalms/app/theme/color_util.dart';
import 'package:get/get.dart';

class MyUtil {
  static showMySnackbar(String title, String desc) {
    Get.isSnackbarOpen == true ? Get.back() : null;
    Get.snackbar(title, desc,
        // backgroundColor: LmsColorUtil.pinkLight.withOpacity(0.3),
        snackStyle: SnackStyle.FLOATING);
  }
}
