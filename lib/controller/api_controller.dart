import 'dart:developer';

import 'package:chefkart/model/dashboard_model.dart';
import 'package:chefkart/model/dish_details_model.dart';
import 'package:chefkart/repository/api_repository.dart';
import 'package:chefkart/screen/dish_details_screen.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  static ApiController to = Get.find();

  @override
  void onReady() {
    super.onReady();
    fetchDashboardData();
  }

  // --------------------------------------------------------------------------
  // Dashboard Data
  // --------------------------------------------------------------------------

  RxBool isLoadingDashboard = true.obs;
  Rx<DashboardModel> dashboardData =
      DashboardModel(dishes: [], popularDishes: []).obs;

  Future<void> fetchDashboardData() async {
    try {
      isLoadingDashboard(true);
      dashboardData(DashboardModel());
      final res = await ApiRepository().fetchDashboardDataRepo();
      if (res is DashboardModel) {
        dashboardData(res);
      }
    } catch (error, stacktrace) {
      log('ERROR : $error');
      log('STACKTRACE : $stacktrace');
    } finally {
      isLoadingDashboard(false);
    }
  }

  // --------------------------------------------------------------------------
  // Dish Details
  // --------------------------------------------------------------------------

  void navigateToDishDetail({required int dishID}) {
    Get.to(
      () => DishDetailsScreen(
        dishID: dishID,
      ),
    );
  }

  RxBool isLoadingDishDetails = true.obs;
  Rx<DishDetailsModel?> dishDetailModel = DishDetailsModel().obs;

  Future<void> fetchDishDetails({required int dishID}) async {
    try {
      isLoadingDishDetails(true);
      dishDetailModel(DishDetailsModel());
      final res = await ApiRepository().fetchDishDetailsRepo(dishID);
      if (res is DishDetailsModel) {
        dishDetailModel(res);
      }
    } catch (error, stacktrace) {
      log('ERROR : $error');
      log('STACKTRACE : $stacktrace');
    } finally {
      isLoadingDishDetails(false);
    }
  }
}
