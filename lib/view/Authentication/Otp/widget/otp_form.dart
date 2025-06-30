import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../../../View_Model/Controller/Authentication/otpController.dart';


class OtpForm extends StatelessWidget {
  OtpForm({super.key});

  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(controller.otpLength, (index) {
              return SizedBox(
                height: 64,
                width: 50,
                child: TextFormField(
                  controller: controller.controllers[index],
                  focusNode: controller.focusNodes[index],
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      if (index < controller.otpLength - 1) {
                        FocusScope.of(context)
                            .requestFocus(controller.focusNodes[index + 1]);
                      } else {
                        controller.focusNodes[index].unfocus();
                        controller.checkAutoFill();
                      }
                    } else if (index > 0) {
                      FocusScope.of(context)
                          .requestFocus(controller.focusNodes[index - 1]);
                    }
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                  decoration: InputDecoration(
                    border: authOutlineInputBorder,
                    enabledBorder: authOutlineInputBorder.copyWith(
                      borderSide: const BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: authOutlineInputBorder.copyWith(
                      borderSide: const BorderSide(color: Color(0xFFFF7643)),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          Obx(() => controller.showResend.value
              ? GestureDetector(
            onTap: controller.resendOtp,
            child:  Text("OtpForm_1st".tr,
                style: TextStyle(color: Colors.blue)),
          )
              : Text("${controller.secondsRemaining} ${"OtpForm_2nd".tr}",
              style: const TextStyle(color: Colors.grey))),


          // const SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: controller.verifyOtp,
          //   child: const Text("驗證"),
          // ),


        ],
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);
