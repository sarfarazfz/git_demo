import 'package:demo_one/screens/activity_profile.dart';
import 'package:demo_one/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_login.dart';

class ActivityLogin extends StatelessWidget {
  const ActivityLogin({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerLogin controllerLogin = Get.put(ControllerLogin());
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          TextField(
            controller: controllerLogin.textEditingControllerEmail,
            decoration: InputDecoration(labelText: "Enter Email Address"),
          ),

          TextField(
            controller: controllerLogin.textEditingControllerPassword,
            decoration: InputDecoration(labelText: "Enter Password"),
            obscureText: true,
          ),

          ElevatedButton(onPressed: () {
            controllerLogin.checkEmailAndPassword();
          }, child: Text("Login"))
        ],
      ),

    );
  }
}
