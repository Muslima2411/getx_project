import 'package:first_project/src/data/repository/app_repository_implementation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/entity/product_model.dart';
import '../../services/dio_service.dart';

class HomePageController extends GetxController {
  RxList<Welcome> productList = <Welcome>[].obs;
  RxBool isLoading = false.obs;
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  void switchTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    Get.changeThemeMode(currentTheme.value);
  }

  Color? colorOfContainer() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    // Get.changeThemeMode(currentTheme.value);
    if (currentTheme.value == ThemeMode.light) {
      return Colors.purpleAccent[100];
    } else {
      return Colors.white;
    }
  }

  void fetchData() async {
    productList.clear();
    isLoading.value = false;
    AppRepositoryImplementation repos = AppRepositoryImplementation();
    productList.value = await repos.getPosts() ?? [];
    isLoading.value = true;
  }

  deleteData(String id) async {
    await DioService.deleteData(id);
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
