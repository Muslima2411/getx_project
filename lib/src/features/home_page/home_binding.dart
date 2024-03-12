import 'package:get/get.dart';

import 'home_page_controller.dart';

class HomeBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }

}