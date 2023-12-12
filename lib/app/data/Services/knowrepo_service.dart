import 'package:dronalms/app/data/Models/KnowRepo.dart';
import 'package:dronalms/app/data/Services/Api_Provider/api_base.dart';
import 'package:dronalms/app/data/Services/Api_Provider/custom_exception.dart';
import 'package:dronalms/app/my_uitl/my_util.dart';

class KnowRepoService {
  final APIBaseService apiBaseService;

  KnowRepoService({required this.apiBaseService});

  static KnowRepoService create() {
    final APIBaseService apiBaseService = APIBaseService();
    return KnowRepoService(apiBaseService: apiBaseService);
  }

  Future<KnowRepoData?> fetchKnowRepo({required String endPoint}) async {
    KnowRepoModel? knowRepoModel;
    try {
      final kRResponseData = await apiBaseService.get(endPoint: endPoint);
      if (kRResponseData != null) {
        if (kRResponseData['status'] == "success") {
          knowRepoModel = KnowRepoModel.fromJson(kRResponseData);
          return knowRepoModel.knowRepoData;
        }
      }
    } on AppException catch (error) {
      MyUtil.showMySnackbar("Error", error.message.toString());
    } catch (e) {
      print(e);
    }
    return knowRepoModel?.knowRepoData;
  }
}
