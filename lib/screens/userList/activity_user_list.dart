import 'package:demo_one/screens/createUser/activity_create_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_user_list.dart';

class ActivityUserList extends StatelessWidget {
  const ActivityUserList({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerUserList controller = Get.put(ControllerUserList());

    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {

            Map<String, dynamic> userItem = controller.rxListUser[index];

            return ListTile(
              title: Text(
                "$index: ${userItem["first_name"]} ${userItem["last_name"]}",
              ),
              subtitle: Text("DOB: ${userItem["dob"]}"),
              trailing: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Alert",
                    barrierDismissible: false,
                    content: Text("Do you want to delete '${userItem['first_name']} ${userItem['last_name']}' record?"),
                    confirm: OutlinedButton(
                      child: Text("Yes"),
                      onPressed: () {
                        controller.db.rawQuery(
                          "DELETE FROM user WHERE uid = '${userItem["uid"]}'",
                        );
                        controller.getUserList();
                        Get.back();
                      },
                    ),
                    cancel: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("No"),
                    ),
                  );
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),

              onTap: () async {
                bool? isInsert = await Get.to(ActivityCreateUser(), arguments: userItem);
                if (isInsert == true) {
                  controller.getUserList();
                }
              },
            );
          },

          itemCount: controller.rxListUser.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isInsert = await Get.to(ActivityCreateUser(), arguments: null);
          if (isInsert == true) {
            controller.getUserList();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
