import 'package:demo_one/screens/activity_second.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../setting/activity_setting.dart';
import 'controller_first.dart';

class ActivityFirst extends StatelessWidget {
  const ActivityFirst({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerFirst controllerFirst = Get.put(ControllerFirst());

    return Scaffold(
      appBar: AppBar(
        title: Text("First"),
        backgroundColor: Colors.purple,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controllerFirst.textEditingControllerFull,
              decoration: InputDecoration(
                labelText: "Please enter your full name",
              ),
            ),

            TextField(
              controller: controllerFirst.textEditingControllerCity,
              decoration: InputDecoration(labelText: "Please enter your city"),
            ),

            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                controllerFirst.saveUserDetails();
              },
              child: Text("Save"),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                controllerFirst.getSharedPrefData();
              },
              child: Text("Get Shared Pref Data"),
            ),

            SizedBox(height: 16,),
            OutlinedButton(onPressed: (){
              Get.to(ActivitySetting());
            }, child: Text("Setting")),



            Obx(() {
              if (controllerFirst.rxFullName.value.isEmpty) {
                return SizedBox();
              } else {
                return Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(controllerFirst.rxFullName.value),
                    subtitle: Text(controllerFirst.rxCity.value),
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () async {
                      String callback = await Get.to(
                        ActivitySecond(),
                        arguments: {
                          'full_name': controllerFirst.rxFullName.value,
                          'city': controllerFirst.rxCity.value,
                        },
                      );
                      // debugPrint("callback: $callback");
                      controllerFirst.rxCallback.value = callback;
                    },
                  ),
                );
              }
            }),

            Obx(() {
              return Text(controllerFirst.rxCallback.value);
            }),
          ],
        ),
      ),
    );
  }
}
