import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {
  final emailController = TextEditingController();
  var isEmailValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      validateEmail(emailController.text);
    });
  }

  void validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    isEmailValid.value = emailRegex.hasMatch(value);
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
