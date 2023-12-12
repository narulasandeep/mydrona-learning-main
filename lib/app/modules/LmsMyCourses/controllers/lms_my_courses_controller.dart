import 'package:dronalms/app/constants/end_points.dart';
import 'package:dronalms/app/data/Models/allcourses.dart';
import 'package:dronalms/app/data/Services/courses_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LmsMyCoursesController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final CoursesService _coursesServices = CoursesService.create();
  late CoursesData _allCoursesData;
  RxList<CoursesRecords> assignedCourseList = <CoursesRecords>[].obs;
  RxList<CoursesRecords> overDueCourseList = <CoursesRecords>[].obs;
  RxList<CoursesRecords> completedCourseList = <CoursesRecords>[].obs;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late CoursesRecords courseRecordDetails;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
     getAllCoursesEndpointsData();
  }

  Future<void> getAllCoursesEndpointsData() async {
    _isLoading.value = true;
    final value = await Future.wait([
      _fetchCourseData(endPoint: EndPoints.ASSIGNED_COURSES),
      _fetchCourseData(endPoint: EndPoints.OVERDUE_COURSES),
      _fetchCourseData(endPoint: EndPoints.COMPLETED_COURSES),
    ]).then((value) => _isLoading.value = false);
  }

  Future<void> _fetchCourseData({required String endPoint}) async {
    _allCoursesData = (await _coursesServices.fetchAllCourses(endPoint: endPoint))!;
    if (_allCoursesData.count != 0 && _allCoursesData.coursesRecords!.isNotEmpty) {
      if (endPoint == EndPoints.ASSIGNED_COURSES) {
        _allCoursesData.coursesRecords?.forEach((record) {
          assignedCourseList.add(record);
        });
      }
      if (endPoint == EndPoints.OVERDUE_COURSES) {
        _allCoursesData.coursesRecords?.forEach((record) {
          overDueCourseList.add(record);
        });
      }
      if (endPoint == EndPoints.COMPLETED_COURSES) {
        _allCoursesData.coursesRecords?.forEach((record) {
          completedCourseList.add(record);
        });
      }
    }
  }

  void clearCoursesList() {
    _isLoading.value = true;
    assignedCourseList.clear();
    _isLoading.value = false;
  }

  void callCourseType({int fetchCourseStatus = 0}) {
    assignedCourseList.clear();
    if (fetchCourseStatus == 0) {
      _fetchCourseData(endPoint: EndPoints.ASSIGNED_COURSES);
    } else if (fetchCourseStatus == 1) {
      _fetchCourseData(endPoint: EndPoints.OVERDUE_COURSES);
    } else if (fetchCourseStatus == 2) {
      _fetchCourseData(endPoint: EndPoints.COMPLETED_COURSES);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
// for (CoursesRecords coursesRecords in _allCoursesData.coursesRecords!) {
//   courseRecordsList.add(coursesRecords);
// }
// for (var record in allCoursesData!data.records) {
//   courseRecordsList.add(record);
// }
// courseRecordsList.add(allCoursesData.records);
// return allCoursesData;
// print("====$allCoursesData====");
// print(allCoursesData.count);
// print(allCoursesData.coursesRecords);
// print(allCoursesData.coursesRecords!.length);
// print(allCoursesData.coursesRecords!.isEmpty);
// void coursesTypeCall() {
//   List<VoidCallback> callFetchCourseData = [
//     fetchCourseData(endPoints: EndPoints.ASSIGNED_COURSES),
//     fetchCourseData(endPoints: EndPoints.OVERDUE_COURSES),
//     fetchCourseData(endPoints: EndPoints.COMPLETED_COURSES),
//   ];
// }
// void get fetchAssignedCourse => _fetchCourseData(endPoints: EndPoints.ASSIGNED_COURSES);
//
// void get fetchOverDueCourse => _fetchCourseData(endPoints: EndPoints.OVERDUE_COURSES);
//
// void get fetchCompletedCourse => _fetchCourseData(endPoints: EndPoints.COMPLETED_COURSES);
// print("====$_allCoursesData====");
// print("====${_allCoursesData.coursesRecords!.length}====");
