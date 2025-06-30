import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LocalizationToggoleController extends GetxController {
  RxBool language = true
      .obs; // true = English, false = Bangla.

  void flagChange() {
    language.value = !language.value;

    if (language.value) {
      Get.updateLocale(Locale("zh", "CN"));
    } else {
      Get.updateLocale(Locale("en", "US"));
    }
  }
}