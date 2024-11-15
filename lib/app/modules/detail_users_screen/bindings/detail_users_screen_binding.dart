import 'package:get/get.dart';

import '../controllers/detail_users_screen_controller.dart';

class DetailUsersScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailUsersScreenController>(
      () => DetailUsersScreenController(),
    );
  }
}
