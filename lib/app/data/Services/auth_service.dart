import 'package:dronalms/app/constants/end_points.dart';
import 'package:dronalms/app/data/Models/user_model.dart';
import 'package:dronalms/app/data/Services/Api_Provider/api_base.dart';
import 'package:dronalms/app/data/Services/Api_Provider/custom_exception.dart';
import 'package:dronalms/app/my_uitl/my_util.dart';

class AuthService {
  late APIBaseService apiBaseService;

  AuthService() {
    apiBaseService = APIBaseService();
  }

  Future<UserModel?> login({required String username, required String password}) async {
    UserModel? userModel;
    String endPoint = EndPoints.LOGIN_ENDPOINT;

    Map<String, String> requestedData = {
      "username": username,
      "password": password,
    };

    try {
      var response = await apiBaseService.post(endPoint: endPoint, requestedData: requestedData);
      if (response != null) {
        if (response['status'] == "success") {
          userModel = UserModel.fromJson(response['data']);
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
