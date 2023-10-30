import 'package:get/get.dart';

class StateChangeController extends GetxController {
  RxInt indexPage = 0.obs;

  changeIndex(int value) {
    indexPage.value = value;
    update();
  }
}
