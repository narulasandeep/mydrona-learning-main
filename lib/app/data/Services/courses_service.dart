import 'package:dronalms/app/constants/end_points.dart';
import 'package:dronalms/app/data/Models/allcourses.dart';
import 'package:dronalms/app/data/Services/Api_Provider/api_base.dart';
import 'package:dronalms/app/data/Services/Api_Provider/custom_exception.dart';
import 'package:dronalms/app/my_uitl/my_util.dart';

class CoursesService {
  final APIBaseService apiBaseService;

  CoursesService({required this.apiBaseService});

  static CoursesService create() {
    final APIBaseService apiBaseService = APIBaseService();
    return CoursesService(apiBaseService: apiBaseService);
  }

  Future<CoursesData?> fetchAllCourses({required String endPoint}) async {
    AllCourses? allCourses;
    try {
      final courseResponseData = await apiBaseService.get(endPoint: endPoint);
      if (courseResponseData != null) {
        if (courseResponseData['status'] == "success") {
          allCourses = AllCourses.fromJson(courseResponseData);
          // print(courseResponseData.toString());
          // print(allCourses.status);
          // print(allCourses.coursesData!.count);
          return allCourses.coursesData;
        }
      }
    } on AppException catch (error) {
      MyUtil.showMySnackbar("Error", error.message.toString());
    } catch (e) {
      print(e);
    }
    return allCourses?.coursesData;
  }
}
