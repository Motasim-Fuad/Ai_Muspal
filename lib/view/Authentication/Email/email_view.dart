import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../View_Model/Controller/Authentication/email_controller.dart';

import 'package:ai_muspal/resource/Colors/app_colors.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:ai_muspal/view/Authentication/Email/widget/email_input_field.dart';

class EmailView extends StatelessWidget {
  EmailView({Key? key}) : super(key: key);
  final emailCtrl = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
               Text(
                "EmailView_1st".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(height: 8),
               Text(
                "EmailView_2nd".tr,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              EmailInputField(controller: emailCtrl.emailController),
              const Spacer(),
              Obx(() => RoundButton(
                title: "EmailView_btn".tr,
                onPress: emailCtrl.isEmailValid.value
                    ? () {
                 Get.toNamed(RouteName.otpView);
                }
                    : null,
                buttonColor: emailCtrl.isEmailValid.value
                    ? AppColor.primaryButtonColor
                    : Colors.grey,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
