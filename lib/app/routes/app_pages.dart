import 'package:get/get.dart';

import '../modules/detail_users_screen/bindings/detail_users_screen_binding.dart';
import '../modules/detail_users_screen/views/detail_users_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.DETAIL_USERS_SCREEN,
      page: () => const DetailUsersScreenView(),
      binding: DetailUsersScreenBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
