import 'package:demo_one/screens/login/activity_login.dart';
import 'package:demo_one/screens/splash/controller_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitySplash extends StatelessWidget {
  const ActivitySplash({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllerSplash controller = Get.put(ControllerSplash());
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Image.asset("assets/images/app_icon.jpg"),
      ),
    );
  }
}
