import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isAuthenticated = false.obs;
  static AuthController instance = Get.find();

  setIsAuthenticated(bool value){
    isAuthenticated.value = value;
  }

  getIsAuthenticated(){
    return isAuthenticated.value;
  }
}