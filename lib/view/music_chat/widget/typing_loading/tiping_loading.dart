
import 'package:ai_muspal/view/music_chat/widget/typing_loading/typing_loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TypingLoadingWidget extends StatelessWidget {
  final TypingLoadingController controller = Get.put(TypingLoadingController());

  TypingLoadingWidget({super.key}) {
    controller.startTypingAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final dots = '.' * controller.dotCount.value;
      return Container(
        height: 30,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(0),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),

          ),
          border: Border.all(color: Colors.black12),
        ),
        child: Text(
          dots,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      );
    });
  }
}



