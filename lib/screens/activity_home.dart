import 'package:demo_one/commons/my_snack_bar.dart';
import 'package:demo_one/screens/activity_about_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityHome extends StatefulWidget {
  const ActivityHome({super.key});

  @override
  State<ActivityHome> createState() => _ActivityHomeState();
}

class _ActivityHomeState extends State<ActivityHome> {
  TextEditingController textEditingControllerMsg = TextEditingController();
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingControllerMsg,
            decoration: InputDecoration(labelText: "Enter your message"),
          ),
          ElevatedButton(
            onPressed: () {
              // stringObj.trim() will remove `white space` and `enter` from start and end of the string
              setState(() {
                String message = textEditingControllerMsg.text.trim();
                list.add(message);
                textEditingControllerMsg.text = "";
              });
            },
            child: Text("Send"),
          ),

          list.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      return ListTile(
                        title: Text("Position: $position"),
                        subtitle: Text(list[position]),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        leading: Icon(Icons.person),
                      );
                    },
                    itemCount: list.length,
                  ),
                )
              : Text("No record found"),
        ],
      ),
    );
  }
}
