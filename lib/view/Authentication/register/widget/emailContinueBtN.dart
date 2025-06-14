import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailContinueButton extends StatelessWidget {
  const EmailContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
            Get.toNamed(RouteName.emailView);
        },
        child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center content
            children: [
              const Icon(Icons.mail, color: Colors.white),
              const SizedBox(width: 8),
              const Text(
                '使用Email繼續',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
