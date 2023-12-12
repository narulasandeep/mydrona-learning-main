import 'package:dronalms/app/components/custom_appbar.dart';
import 'package:dronalms/app/components/lms_drawer.dart';
import 'package:dronalms/app/components/round_icon_button.dart';
import 'package:dronalms/app/data/Models/KnowRepo.dart';
import 'package:dronalms/app/theme/color_util.dart';
import 'package:dronalms/app/theme/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class TileContentView extends StatelessWidget {
  const TileContentView({Key? key, required this.knowRepoRecords}) : super(key: key);

  final KnowRepoRecords knowRepoRecords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: LmsDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, top: 24.h, right: 25.w, bottom: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundIconButton(onTap: () {
                        Get.back();
                      }),
                      Text('Knowledge Repository', style: LmsTextUtil.textRoboto24()),
                      SizedBox(),
                    ],
                  ),
                  SizedBox(height: 38.h),
                  Container(
                    width: ScreenUtil().screenWidth,
                    alignment: Alignment.topLeft,
                    child: Text(knowRepoRecords.title!,
                        style: LmsTextUtil.textManrope16(color: Colors.black)),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    knowRepoRecords.content!,
                    style: LmsTextUtil.textManrope14(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.square_rounded, color: LmsColorUtil.lightBlueIcons),
                  SizedBox(width: 10.w),
                  Text(
                    "Acknowledge",
                    style: LmsTextUtil.textManrope16(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
