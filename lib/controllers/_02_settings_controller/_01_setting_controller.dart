import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingsController extends GetxController {
  RxBool darkMode = false.obs;
  RxBool playInBg = false.obs;
  void changeMode() {
    darkMode.value = !darkMode.value;
  }

  void changeBgMode() {
    playInBg.value = !playInBg.value;
  }
}
