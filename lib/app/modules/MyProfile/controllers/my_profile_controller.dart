import 'package:dronalms/app/constants/end_points.dart';
import 'package:dronalms/app/data/Models/user_model.dart';
import 'package:dronalms/app/data/Services/Api_Provider/api_base.dart';
import 'package:dronalms/app/data/Services/profileme_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyProfileController extends GetxController {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController entityController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController dateOfJoiningController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController languageController = TextEditingController();

  final Rx<UserModel> _userModelData = UserModel().obs;

  final RxBool isReadOnly = true.obs;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  final ProfileMeService _profileMeService = ProfileMeService.create();

  @override
  void onInit() {
    super.onInit();
    _isLoading.value = true;
    getProfileData();
  }

  Future<void> setInitialValue(final UserModel userModel) async {
    userIdController.text = userModel.userId!;
    userNameController.text = userModel.name!;
    emailController.text = userModel.email!;
    phoneNoController.text = userModel.phone!;
    entityController.text = userModel.userId!;
    dateOfBirthController.text = userModel.dob!;
    dateOfJoiningController.text = userModel.doj!;
    locationController.text = userModel.location!;
    roleController.text = userModel.role!;
    departmentController.text = userModel.department!;
    languageController.text = "English / Hindi";
  }

  Future<void> getProfileData() async {
    final UserModel? userModelData =
        await _profileMeService.fetchUserModel(endPoint: EndPoints.PROFILE_ME);
    setInitialValue(userModelData!).then((value) => _isLoading.value = false);
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
// void getInitialValue() {
//   userIdController.text = 'USER008';
//   userNameController.text = 'Tarun Chauhan';
//   emailController.text = 'chauhan.tarun@4thpointer';
//   phoneNoController.text = '9306500147';
//   entityController.text = 'Entity New';
//   dateOfBirthController.text = '19/08/1997';
//   dateOfJoiningController.text = '5/April/2022';
//   locationController.text = 'India';
//   roleController.text = 'Job';
//   departmentController.text = 'Development';
//   languageController.text = 'Hindi';
// }
