import 'package:dronalms/app/components/custom_appbar.dart';
import 'package:dronalms/app/components/lms_drawer.dart';
import 'package:dronalms/app/modules/LmsMyCourses/components/mycourses_detail.dart';
import 'package:dronalms/app/my_uitl/loading_indicator.dart';
import 'package:dronalms/app/my_uitl/my_util.dart';
import 'package:dronalms/app/routes/app_pages.dart';
import 'package:dronalms/app/theme/color_util.dart';
import 'package:dronalms/app/theme/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/lms_my_courses_controller.dart';

class LmsMyCoursesView extends GetView<LmsMyCoursesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: LmsDrawer(),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 18.w, top: 10.h, right: 18.w, bottom: 10.h),
                alignment: Alignment.topLeft,
                child: Text("My Courses", style: LmsTextUtil.textRoboto24()),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.w, top: 10.h, right: 20.w, bottom: 10.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.tabController.index > 0) {
                          controller.tabController.animateTo(controller.tabController.index - 1);
                        }
                      },
                      child: Icon(Icons.arrow_back_ios, size: 20.sp),
                    ),
                    Expanded(
                      child: TabBar(
                        onTap: (value) {
                          controller.tabController.index = value;
                        },
                        controller: controller.tabController,
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        labelStyle: LmsTextUtil.textManrope16(color: Colors.black),
                        unselectedLabelColor: LmsColorUtil.greyColor4,
                        labelColor: Colors.black,
                        padding: EdgeInsets.all(0),
                        physics: BouncingScrollPhysics(),
                        splashBorderRadius: BorderRadius.circular(20),
                        tabs: [
                          Text(
                            "Assigned(${controller.assignedCourseList.length})",
                          ),
                          // Text("In-Progress(4)"),
                          Text(
                            "Overdue(${controller.overDueCourseList.length})",
                          ),
                          Text(
                            "Completed(${controller.completedCourseList.length})",
                          ),
                          // Text("Failed(7)"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.tabController.index < 3) {
                          controller.tabController.animateTo(controller.tabController.index + 1);
                        } else {
                          MyUtil.showMySnackbar("Can't Go ahead", "Try Back");
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios, size: 20.sp),
                    ),
                  ],
                ),
              ),
              controller.isLoading
                  ? LoadingIndicator()
                  : Expanded(
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          ListView.builder(
                            itemCount: controller.assignedCourseList.length,
                            itemBuilder: (context, index) {
                              final courseRecord = controller.assignedCourseList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.courseRecordDetails = courseRecord;
                                  Get.toNamed(Routes.COURSE_DETAIL);
                                },
                                child: MyCoursesDetail(
                                  courseRecord: courseRecord,
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: controller.overDueCourseList.length,
                            itemBuilder: (context, index) {
                              final courseRecord = controller.overDueCourseList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.courseRecordDetails = courseRecord;
                                  Get.toNamed(Routes.COURSE_DETAIL);
                                },
                                child: MyCoursesDetail(
                                  courseRecord: courseRecord,
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: controller.completedCourseList.length,
                            itemBuilder: (context, index) {
                              final courseRecord = controller.completedCourseList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.courseRecordDetails = courseRecord;
                                  Get.toNamed(Routes.COURSE_DETAIL);
                                },
                                child: MyCoursesDetail(
                                  courseRecord: courseRecord,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
