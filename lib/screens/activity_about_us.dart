import 'package:demo_one/screens/splash/activity_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityAboutUs extends StatelessWidget {
  const ActivityAboutUs({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Get.off(ActivitySplash());
        }, child: Text("Splash")),
      ),
    );
  }
}
