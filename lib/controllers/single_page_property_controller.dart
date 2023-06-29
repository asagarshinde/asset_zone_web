import 'package:get/get.dart';

class SinglePagePropertyController extends GetxController {
  static SinglePagePropertyController instance = Get.find();
  final property = {

  }.obs;
  final middle_widget = "ABOUT".obs;

}