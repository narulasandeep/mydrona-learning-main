import 'package:dronalms/app/data/Models/user_model.dart';
import 'package:dronalms/app/data/Services/Api_Provider/api_base.dart';
import 'package:dronalms/app/data/Services/Api_Provider/custom_exception.dart';
import 'package:dronalms/app/my_uitl/my_util.dart';

class ProfileMeService {
  final APIBaseService apiBaseService;

  ProfileMeService({required this.apiBaseService});

  static ProfileMeService create() {
    final APIBaseService apiBaseService = APIBaseService();
    return ProfileMeService(apiBaseService: apiBaseService);
  }

  Future<UserModel?> fetchUserModel({required String endPoint}) async {
    UserModel? userModel;
    try {
      final uModelResponse = await apiBaseService.post(endPoint: endPoint, requestedData: {"": ""});
      if (uModelResponse != null) {
        if (uModelResponse['status'] == "success") {
          userModel = UserModel.fromJson(uModelResponse['data']);
          return userModel;
        }
      }
    } on AppException catch (error) {
      MyUtil.showMySnackbar("Error", error.message.toString());
    } catch (e) {
      print(e);
    }
    return userModel;
  }
}
