import 'package:demo_one/screens/activity_profile.dart';
import 'package:demo_one/screens/editProfile/controller_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/my_snack_bar.dart';

class ActivityEditProfile extends StatelessWidget {
  const ActivityEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerEditProfile controllerEditProfile = Get.put(
      ControllerEditProfile(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controllerEditProfile.textEditingControllerFull,
              decoration: InputDecoration(labelText: "Please Enter Full Name"),
            ),

            SizedBox(height: 16),

            TextField(
              controller: controllerEditProfile.textEditingControllerCity,
              decoration: InputDecoration(labelText: "Please Enter City"),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                controllerEditProfile.saveUserData();
              },
              child: Text("Save"),
            ),

            SizedBox(height: 16),

            Obx(() {
              return ListTile(
                title: Text(controllerEditProfile.strFullName.value),
                subtitle: Text(controllerEditProfile.strCity.value),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                leading: Icon(Icons.person),

                onTap: () {
                  if (controllerEditProfile.strFullName.value.isNotEmpty &&
                      controllerEditProfile.strCity.value.isNotEmpty) {
                    Get.to(
                      ActivityProfile(
                        strFullName: controllerEditProfile.strFullName.value,
                        strCity: controllerEditProfile.strCity.value,
                      ),
                    );
                  } else {
                    MySnackBar.errorSnack("Error", "Field should not be empty");
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
