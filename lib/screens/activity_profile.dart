import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'activity_home.dart';

class ActivityProfile extends StatelessWidget {

  String strFullName = "";
  String strCity = "";

  ActivityProfile({super.key, required this.strFullName, required this.strCity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListTile(
        title: Text(strFullName),
        subtitle: Text(strFullName),
        leading: Icon(Icons.ac_unit),
        trailing: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
