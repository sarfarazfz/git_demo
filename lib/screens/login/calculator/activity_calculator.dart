import 'package:demo_one/enums/enum_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller_calculator.dart';

class ActivityCalculator extends StatelessWidget {
  const ActivityCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    // put in RAM memory
    ControllerCalculator controllerCalculator = Get.put(ControllerCalculator());

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            TextField(
              controller: controllerCalculator.textEditingControllerFirst,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(labelText: "Enter First Number"),
            ),

            TextField(
              controller: controllerCalculator.textEditingControllerSecond,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(labelText: "Enter Second Number"),
            ),

            SizedBox(
              height: 16,
            ),

            ElevatedButton(onPressed: (){
              controllerCalculator.calculateNumbers(EnumCalculator.add);
            }, child: Text("+")),

            SizedBox(
              height: 16,
            ),


            ElevatedButton(onPressed: (){
              controllerCalculator.calculateNumbers(EnumCalculator.sub);
            }, child: Text("-")),

            SizedBox(
              height: 16,
            ),

            ElevatedButton(onPressed: (){
              controllerCalculator.calculateNumbers(EnumCalculator.mul);
            }, child: Text("x")),


            SizedBox(
              height: 16,
            ),


            ElevatedButton(onPressed: (){
              controllerCalculator.calculateNumbers(EnumCalculator.div);
            }, child: Text("/")),


            SizedBox(
              height: 16,
            ),

            Obx((){
              return Text(controllerCalculator.strResult.value);
            })
          ],
        ),
      ),
    );
  }
}
