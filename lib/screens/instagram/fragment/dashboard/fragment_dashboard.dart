import 'package:demo_one/screens/instagram/fragment/dashboard/controller_fragment_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/model_food.dart';

class FragmentDashboard extends StatelessWidget {
  const FragmentDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    ControllerFragmentDashboard controller = Get.put(
      ControllerFragmentDashboard(),
    );

    return Obx(() {

      return ListView.builder(itemBuilder: (context, index) {
        Data listItem = controller.rxList[index];
        return ListTile(
          title: Text(listItem.name.toString()),
          subtitle: Text(listItem.description.toString()),
          trailing: Text(listItem.price.toString()),
          leading: Text(listItem.category.toString()),
        );
      },
      itemCount: controller.rxList.length,);
    });
  }
}
