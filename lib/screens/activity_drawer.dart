import 'package:demo_one/commons/my_snack_bar.dart';
import 'package:flutter/material.dart';

class ActivityDrawer extends StatelessWidget {
  const ActivityDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(child: Text("I am Drawer screen")),

      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.person),
                  Text("Shafik Shaikh"),
                  Text("mrshafique007@gmail.com")
                ],
              ),
            ),

            ListTile(
              title: Text("Dashboard"),
              leading: Icon(Icons.dashboard),
              onTap: () {
                MySnackBar.warningSnack("Drawer Item", "Dashboard clicked");
              },
            ),
            ListTile(
              title: Text("Search"),
              leading: Icon(Icons.search),
              onTap: () {
                MySnackBar.warningSnack("Drawer Item", "Search clicked");
              },
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
              onTap: () {
                MySnackBar.warningSnack("Drawer Item", "Profile clicked");
              },
            ),
          ],
        ),
      ),
    );
  }
}
