import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../commons/my_snack_bar.dart';
import 'controller_create_user.dart';

class ActivityCreateUser extends StatelessWidget {
  const ActivityCreateUser({super.key});

  @override
  Widget build(BuildContext context) {

    // {uid: 8, first_name: Bruce, last_name: Wayne, dob: 12 Jul 1942 (83)}
    Map<String, dynamic>? userItem = Get.arguments;
    ControllerCreateUser controller = Get.put(ControllerCreateUser(userItem: userItem));

    return Scaffold(
      appBar: AppBar(
        title: Text(userItem == null ? "Create New User" : "Update User"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.textEditingControllerFirst,
              decoration: InputDecoration(labelText: "Enter First Name"),
            ),

            SizedBox(height: 16),

            TextField(
              controller: controller.textEditingControllerLast,
              decoration: InputDecoration(labelText: "Enter Last Name"),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.calendar_month_outlined),
              title: Text("Date of Birth"),
              subtitle: Obx(() {
                return Text(controller.rxDob.value);
              }),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                controller.dobPicker(context);
              },
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                controller.createNewUser();
                // bool? isInsert = await controller.createNewUser();
                // if(isInsert == true){
                //   Get.back();
                //   MySnackBar.successSnack("Success", "User created successfully");
                // }
              },
              child: Text(userItem == null ? "Save" : "Update"),
            ),
          ],
        ),
      ),
    );
  }
}
