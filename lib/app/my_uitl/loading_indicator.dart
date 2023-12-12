import 'package:dronalms/app/theme/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 200.h),
      child: Center(
        child: CircularProgressIndicator(
          color: LmsColorUtil.primaryThemeColor,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
