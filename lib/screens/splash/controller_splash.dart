import 'package:demo_one/screens/activity_home.dart';
import 'package:demo_one/screens/login/activity_login.dart';
import 'package:demo_one/screens/activity_profile.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerSplash extends GetxController {
  late SharedPreferences prefs;
  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    redirectAfter5sec();
    super.onInit();
  }

  void redirectAfter5sec() {
    Future.delayed(Duration(seconds: 5), () {
      bool? isLogin = prefs.getBool("isLogin");
      bool? isProfile = prefs.getBool("isProfile");

      if(isLogin == true && isProfile == true) {
        Get.off(ActivityHome());
      } else if(isLogin == true && isProfile == false) {
        Get.off(ActivityProfile(strCity: "",strFullName: "",));
      } else {
        Get.off(ActivityLogin());
      }
    });
  }

  // method: return_type method_name (parameter) { code_block }
}