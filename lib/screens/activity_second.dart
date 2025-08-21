import 'package:demo_one/commons/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitySecond extends StatelessWidget {
  const ActivitySecond({super.key});

  @override
  Widget build(BuildContext context) {

    var dataFromPrevScreen = Get.arguments;
    debugPrint("dataFromPrevScreen: $dataFromPrevScreen");
    // dataFromPrevScreen: {full_name: Shafik, city: Latur}
    String fullName = dataFromPrevScreen['full_name'];
    String city = dataFromPrevScreen['city'];

    TextEditingController textEditingControllerCallback = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Column(
        children: [

          ListTile(
            leading: Icon(Icons.person),
            title: Text(fullName),
            subtitle: Text(city),
          ),

          TextField(
            controller: textEditingControllerCallback,
            decoration: InputDecoration(
              labelText: "Enter callback value"
            ),
          ),


          OutlinedButton(onPressed: () {
            String callback = textEditingControllerCallback.text;
            if(callback.isEmpty) {
              MySnackBar.errorSnack("Error", "Please enter callback value");
              return;
            }


            Get.back(result: callback);
          }, child: Text("Back"))


        ],
      ),
    );
  }
}
