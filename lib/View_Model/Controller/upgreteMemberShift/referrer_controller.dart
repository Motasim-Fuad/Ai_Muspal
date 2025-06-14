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
      referralStatusMessage.value = "推薦碼已經套用";
      return;
    }

    if (referralCode.value == validReferralCode) {
      isReferralApplied.value = true;
      referralStatusMessage.value = "推薦碼已成功套用！";
    } else {
      isReferralApplied.value = false;
      referralStatusMessage.value = "推薦碼無效";
    }
  }
}
