import 'package:demo_one/screens/setting/controller_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitySetting extends StatelessWidget {
  const ActivitySetting({super.key});

  @override
  Widget build(BuildContext context) {

    ControllerSetting controller = Get.put(ControllerSetting());

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),

        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),


      body:Column(
        children: [

          ElevatedButton(onPressed: (){
            controller.prefs.setBool("isMusic", true);
            controller.rxMusic.value = "isMusicData: true";
          }, child: Text("Music on")),
          SizedBox(height: 16,),
          ElevatedButton(onPressed: (){
            controller.prefs.setBool("isMusic", false);
            controller.rxMusic.value = "isMusicData: false";
          }, child: Text("Music off")),

          SizedBox(height: 16,),
          Obx((){
            return Text(controller.rxMusic.value);
          })
        ],
      ),
    );
  }
}
