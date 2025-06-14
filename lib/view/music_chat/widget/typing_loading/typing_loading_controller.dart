import 'dart:async';

import 'package:get/get.dart';

class TypingLoadingController extends GetxController {
  final dotCount = 0.obs;
  late Timer _timer;

  void startTypingAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      dotCount.value = (dotCount.value + 1) % 4;
    });
  }

  void stopTypingAnimation() {
    _timer.cancel();
    dotCount.value = 0; // reset if needed
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}