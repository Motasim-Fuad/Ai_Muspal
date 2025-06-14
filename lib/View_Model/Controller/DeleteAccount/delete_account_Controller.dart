import 'dart:async';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class DeleteAccountController extends GetxController {
  RxBool isDeleteEnabled = false.obs;
  RxInt selectedCount = 5.obs;

  Timer? _timer;

  @override
  void onClose() {
    _timer?.cancel(); // Cancel timer when controller is disposed
    super.onClose();
  }

  void startCountdown() {
    selectedCount.value = 5;
    isDeleteEnabled.value = false;

    _timer?.cancel(); // Cancel any previous timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (selectedCount.value > 0) {
        selectedCount.value--;
      } else {
        isDeleteEnabled.value = true;
        timer.cancel(); // Stop the timer
      }
    });
  }

  void deleteAccount() {
    print("Deleting account...");


    // Add your deletion logic here
  }
}
