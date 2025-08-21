import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../model/model_food.dart';

class ControllerFragmentDashboard extends GetxController {
  RxList<Data> rxList = <Data>[].obs;
  @override
  void onInit() {
    getFoodMenuData();
    super.onInit();
  }

  void getFoodMenuData() async {
    var strJson = await rootBundle.loadString("assets/json/food_menu.json");
    //debugPrint(strJson);
    Map<String, dynamic> map = json.decode(strJson);

    ModelFood modelFoodMenu = ModelFood.fromJson(map);
    rxList.value = modelFoodMenu.data!;
  }
}
