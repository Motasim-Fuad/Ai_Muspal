import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferralController extends GetxController {
  final referralCode = ''.obs;
  final isButtonEnabled = false.obs;

  final isReferralApplied = false.obs;
  final referralStatusMessage = ''.obs;

  final validReferralCode = 'ABC123';

  void onReferralCodeChanged(String value) {
    referralCode.value = value.trim();
    isButtonEnabled.value = value.trim().isNotEmpty;

    // Reset status message when user edits input
    referralStatusMessage.value = '';
    isReferralApplied.value = false;
  }

  void applyReferral() {
    if (isReferralApplied.value) {
      referralStatusMessage.value = "ReferralController_1st".tr;
      return;
    }

    if (referralCode.value == validReferralCode) {
      isReferralApplied.value = true;
      referralStatusMessage.value = "ReferralController_2nd".tr;
    } else {
      isReferralApplied.value = false;
      referralStatusMessage.value = "ReferralController_3rd".tr;
    }
  }
}
