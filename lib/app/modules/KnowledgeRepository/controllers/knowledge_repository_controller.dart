import 'package:dronalms/app/constants/end_points.dart';
import 'package:dronalms/app/data/Models/KnowRepo.dart';
import 'package:dronalms/app/data/Services/knowrepo_service.dart';
import 'package:get/get.dart';

class KnowledgeRepositoryController extends GetxController {
  final KnowRepoService _knowRepoService = KnowRepoService.create();
  late final KnowRepoData _knowRepoData;
  final RxList<KnowRepoRecords> _knowRepoRecords = <KnowRepoRecords>[].obs;

  List<KnowRepoRecords> get knowRepoRecords => _knowRepoRecords;

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _isLoading.value = true;
    fetchKRData();
  }

  Future<void> fetchKRData({String endPoint = EndPoints.KNOWLEDGE_REPOSITORY}) async {
    _knowRepoData = (await _knowRepoService.fetchKnowRepo(endPoint: endPoint))!;
    if (_knowRepoData.count! != 0 && _knowRepoData.records!.isNotEmpty) {
      _knowRepoData.records?.forEach((record) {
        _knowRepoRecords.add(record);
        _isLoading.value = false;
      });
    }
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
