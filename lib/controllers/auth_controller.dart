import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_asset_zone_web/constants/controllers.dart';

class AuthController extends GetxController {
  RxBool isAuthenticated = false.obs;
  static AuthController instance = Get.find();

  Rx<bool> isAuthenticatedShared = false.obs;

  Future<bool?> getAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    navBarController.showPropertyAdd.value = prefs.getBool('auth')!;
    return prefs.getBool("auth")!;
  }

  setIsAuthenticated(bool value){
    isAuthenticated.value = value;
    propertyController.setInSharedPreferences("isAuthenticated", "true");
  }

  getIsAuthenticated(){
    return isAuthenticated.value;
  }
}