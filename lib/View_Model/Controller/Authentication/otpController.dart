import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpController extends GetxController with GetTickerProviderStateMixin {
  final int otpLength = 6;
  final String correctOtp = "123456"; // Replace with actual OTP logic

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  RxInt secondsRemaining = 60.obs;
  RxBool showResend = false.obs;

  @override
  void onInit() {
    super.onInit();

    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());

    for (int i = 0; i < otpLength; i++) {
      controllers[i].addListener(() {
        final text = controllers[i].text;
        if (text.length > 1) _handlePaste(text);
        checkAutoFill();
      });
    }

    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), _updateTimer);
  }

  void _updateTimer() {
    if (secondsRemaining.value > 0) {
      secondsRemaining.value--;
      _startCountdown();
    } else {
      showResend.value = true;
    }
  }

  void _handlePaste(String pastedText) {
    final cleaned = pastedText.replaceAll(RegExp(r'[^0-9]'), '');
    for (int i = 0; i < otpLength; i++) {
      if (i < cleaned.length) {
        controllers[i].text = cleaned[i];
      } else {
        controllers[i].clear();
      }
    }
    if (cleaned.length >= otpLength) {
      checkAutoFill();
    }
  }

  void checkAutoFill() {
    final otp = getOtpCode();
    if (otp.length == otpLength) _validateOtp(otp);
  }

  String getOtpCode() {
    return controllers.map((c) => c.text).join();
  }

  void _validateOtp(String otp) {
    if (otp == correctOtp) {
      Get.offNamed(RouteName.welcomeView);
    } else {
      Fluttertoast.showToast(
        msg: "OTP verification failed!",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void resendOtp() {
    secondsRemaining.value = 60;
    showResend.value = false;
    _startCountdown();
    Fluttertoast.showToast(
      msg: "OTP re-sent!",
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  void verifyOtp() {
    final otp = getOtpCode();
    if (otp.length < otpLength) {
      Fluttertoast.showToast(
        msg: "請輸入完整驗證碼",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
    } else {
      _validateOtp(otp);
    }
  }

  @override
  void onClose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.onClose();
  }
}
