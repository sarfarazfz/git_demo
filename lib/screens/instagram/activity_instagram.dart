import 'package:demo_one/screens/instagram/fragment/fragment_add_new.dart';
import 'package:demo_one/screens/instagram/fragment/fragment_profile.dart';
import 'package:demo_one/screens/instagram/fragment/fragment_reels.dart';
import 'package:demo_one/screens/instagram/fragment/fragment_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_instagram.dart';
import 'fragment/dashboard/fragment_dashboard.dart';

class ActivityInstagram extends StatelessWidget {
  const ActivityInstagram({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerInstagram controller = Get.put(ControllerInstagram());

    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.rxSelectedBottomNavIndex.value == 0) {
          return FragmentDashboard();
        }

        if (controller.rxSelectedBottomNavIndex.value == 1) {
          return FragmentSearch();
        }

        if (controller.rxSelectedBottomNavIndex.value == 2) {
          return FragmentAddNew();
        }

        if (controller.rxSelectedBottomNavIndex.value == 3) {
          return FragmentReels();
        }

        return FragmentProfile();
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          // selected bottom nav index
          currentIndex: controller.rxSelectedBottomNavIndex.value,
          onTap: (index) {
            // index? => which bottom nav item clicked
            controller.rxSelectedBottomNavIndex.value = index;
          },

          items: [
            // 0: dashboard
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            // 1: search
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            // 2: add new
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add New"),
            // 3: reels
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_sharp),
              label: "Reels",
            ),
            // 4: profile
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],

          // bottom nav background color
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red,
          // selected item color
          fixedColor: Colors.white,
        );
      }),

      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("Welcome")),

            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () {
                changeFragment(controller: controller, index: 0);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
              onTap: () {
                changeFragment(index: 1, controller: controller);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add New"),
              onTap: () {
                changeFragment(index: 2, controller: controller);
              },
            ),
            ListTile(
              leading: Icon(Icons.video_library_sharp),
              title: Text("Reels"),
              onTap: () {
                changeFragment(index: 3, controller: controller);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                changeFragment(index: 4, controller: controller);
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeFragment({
    required ControllerInstagram controller,
    required int index,
  }) {
    controller.rxSelectedBottomNavIndex.value = index;
    Get.back(); // close drawer
  }
}
