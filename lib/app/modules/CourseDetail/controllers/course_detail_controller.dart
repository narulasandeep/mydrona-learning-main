import 'package:dronalms/app/data/Models/allcourses.dart';
import 'package:dronalms/app/modules/LmsMyCourses/controllers/lms_my_courses_controller.dart';
import 'package:get/get.dart';

class CourseDetailController extends GetxController {

  late final LmsMyCoursesController lmsMyCoursesController;
  late CoursesRecords courseRecord;

  @override
  void onInit() {
    super.onInit();
    lmsMyCoursesController = Get.find<LmsMyCoursesController>();
    courseRecord = lmsMyCoursesController.courseRecordDetails;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

  }
}
