import 'package:dronalms/app/data/Services/Api_Provider/api_base.dart';

class UserNotifyService{
  final APIBaseService apiBaseService;

  UserNotifyService({required this.apiBaseService});

  static UserNotifyService create() {
    final APIBaseService apiBaseService = APIBaseService();
    return UserNotifyService(apiBaseService: apiBaseService);
  }




}