import 'package:dronalms/app/constants/environments.dart';
import 'package:dronalms/app/data/Models/allcourses.dart';
import 'package:dronalms/app/theme/color_util.dart';
import 'package:dronalms/app/theme/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyCoursesDetail extends StatelessWidget {
  const MyCoursesDetail({
    Key? key,
    required this.courseRecord,
  }) : super(key: key);
  final CoursesRecords courseRecord;

  String getPercentageValue() {
    final int completedChapters =
        courseRecord.completedChapters!.isEmpty ? 0 : courseRecord.completedChapters!.length;
    final int quizMapped = courseRecord.quizzes!.length;
    final int chaptersMapped =
        courseRecord.chaptersMapped!.isEmpty ? 1 : courseRecord.chaptersMapped!.length;
    final percentComplete = ((completedChapters) / (chaptersMapped)) * 100;
    if (percentComplete > 100.0) {
      return "100";
    } else {
      return percentComplete.toInt().toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.all(8.h),
      // margin: EdgeInsets.only(top: 10.h),
      child: Container(
        height: 115.h,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.sp)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: LmsColorUtil.primaryThemeColor.withOpacity(0.25), //New
              blurRadius: 9.0,
            )
          ],
        ),
        // padding: EdgeInsets.only(left: 15.w, top: 7.h),
        child: Row(
          children: [
            Container(
              height: 115.h,
              width: 115,
              // color: LmsColorUtil.primaryThemeColor,
              child:
                  Image.network("${Environments.DEV}/${courseRecord.thumbnail}", fit: BoxFit.fill),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 220.w,
                      height: 50.h,
                      child: Text(
                        courseRecord.title!,
                        style: LmsTextUtil.textManrope20(color: Colors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // softWrap: false,
                      ),
                    ),
                    // SizedBox(width: 10.w),
                    iconTextRow(
                        iconData: Icons.access_time_outlined, title: "${courseRecord.hours} Hr"),
                  ],
                ),
                // SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 125.w,
                      child: Text(
                        "Due Date: ${courseRecord.dueDate}",
                        style: LmsTextUtil.textManrope12(),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    SizedBox(
                      width: 95.w,
                      child: iconTextRow(
                          iconData: Icons.sticky_note_2_sharp,
                          title: courseRecord.courselevel!.capitalizeFirst!),
                    ),
                    progressIndicator(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconTextRow({
    required IconData iconData,
    required String title,
  }) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          color: LmsColorUtil.primaryThemeColor,
          size: 18.sp,
        ),
        SizedBox(width: 2.w),
        Text(
          title,
          style: LmsTextUtil.textManrope12(color: Colors.black),
        ),
      ],
    );
  }

  Widget progressIndicator() {
    return Container(
      height: 45.h,
      width: 45.w,
      child: CircularPercentIndicator(
        radius: 22.sp,
        lineWidth: 5.sp,
        startAngle: 0.0,
        animation: true,
        progressColor: LmsColorUtil.primaryThemeColor,
        arcBackgroundColor: LmsColorUtil.greyColor1,
        arcType: ArcType.values[2],
        percent: double.tryParse(getPercentageValue())! / 100,
        center: Text(
          "${getPercentageValue()}%",
          style: LmsTextUtil.textManrope12(color: Colors.black),
        ),
      ),
    );
  }
}
