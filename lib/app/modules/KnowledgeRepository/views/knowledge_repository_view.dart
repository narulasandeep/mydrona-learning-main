import 'package:dronalms/app/components/custom_appbar.dart';
import 'package:dronalms/app/components/lms_drawer.dart';
import 'package:dronalms/app/data/Models/KnowRepo.dart';
import 'package:dronalms/app/modules/KnowledgeRepository/views/knowledge_tile.dart';
import 'package:dronalms/app/modules/KnowledgeRepository/views/tile_content_view.dart';
import 'package:dronalms/app/my_uitl/loading_indicator.dart';
import 'package:dronalms/app/theme/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/knowledge_repository_controller.dart';

class KnowledgeRepositoryView extends GetView<KnowledgeRepositoryController> {
  const KnowledgeRepositoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: LmsDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, top: 24.h, right: 25.w, bottom: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: ScreenUtil().screenWidth,
                alignment: Alignment.topLeft,
                child: Text("Knowledge Repository", style: LmsTextUtil.textRoboto24()),
              ),
              SizedBox(height: 38.h),
              Obx(
                () => controller.isLoading
                    ? LoadingIndicator()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.knowRepoRecords.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (_, index) {
                            final List<KnowRepoRecords> knowRepoRecord = [
                              ...controller.knowRepoRecords
                            ];
                            return GestureDetector(
                              onTap: () => Get.to(
                                  () => TileContentView(knowRepoRecords: knowRepoRecord[index])),
                              child: KnowledgeTile(knowRepoRecord: knowRepoRecord[index]),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
