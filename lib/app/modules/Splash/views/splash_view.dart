import 'package:dronalms/app/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageConstants.DRONALOGOBIG,
        ),
      ),
    );
  }
}
