import 'dart:developer';

import 'package:chefkart/model/dashboard_model.dart';
import 'package:chefkart/model/dish_details_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  String baseUrl = '8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io';

  // --------------------------------------------------------------------------
  // Dashboard Data
  // --------------------------------------------------------------------------

  Future<DashboardModel?> fetchDashboardDataRepo() async {
    try {
      final url = Uri.https(baseUrl, 'dishes/v1');
      final response = await http.get(url);

      // log('CODE : ${response.statusCode}');
      // log('BODY : ${response.body}');

      if (response.statusCode == 200) {
        return dashboardModelFromJson(response.body);
      }
    } catch (error, stacktrace) {
      log('ERROR : $error');
      log('STACKTRACE : $stacktrace');
    }
    return null;
  }

  // --------------------------------------------------------------------------
  // Dish Details
  // --------------------------------------------------------------------------

  Future<DishDetailsModel?> fetchDishDetailsRepo(String dishID) async {
    try {
      final url = Uri.https(baseUrl, 'dishes/v1/$dishID');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return dishDetailsModelFromJson(response.body);
      }
    } catch (error, stacktrace) {
      log('ERROR : $error');
      log('STACKTRACE : $stacktrace');
    }
    return null;
  }
}
