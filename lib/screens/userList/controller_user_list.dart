import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../services/service_db.dart';

class ControllerUserList extends GetxController {
  Database db = Get.find();
  RxList<Map<String, dynamic>> rxListUser = <Map<String, dynamic>>[].obs;
  @override
  void onInit() async {
    getUserList();
    super.onInit();
  }

  void getUserList() async {
    List<Map<String, dynamic>> listUser = await db.rawQuery("SELECT * FROM user");
    debugPrint("listUser: $listUser");
    rxListUser.value = listUser;
  }
}