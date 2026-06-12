import 'package:get/get.dart';

class NavigationController extends GetxController {
  // Global variable to hold the active tab state across screens
  var currentTab = 'Home'.obs;

  void changeTab(String tabName) {
    currentTab.value = tabName;
  }
}