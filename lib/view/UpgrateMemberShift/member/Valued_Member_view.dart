import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../View_Model/Controller/upgreteMemberShift/referrer_controller.dart';
import '../../../resource/App_routes/routes_name.dart';
import '../../../resource/asseets/image_assets.dart';
import '../../../resource/compunents/RoundButton.dart';
class ValuedMemberView extends StatefulWidget {
  const ValuedMemberView({super.key});

  @override
  State<ValuedMemberView> createState() => _ValuedMemberViewState();
}

class _ValuedMemberViewState extends State<ValuedMemberView> {
  final ReferralController controller = Get.put(ReferralController());
  @override
  Widget _buildPlanFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Color(0xffbfdc36), size: 20),
          const SizedBox(width: 8),
          Flexible(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(ImageAssets.valedMember_animation2, height: 200),
            const SizedBox(height: 10),
            // [Membership Info]
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xfff9fceb), // light green background
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffbfdc36)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'ValuedMemberView_c1_1st'.tr,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children:  [
                      Text(
                        'ValuedMemberView_c1_2nd'.tr,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'ValuedMemberView_c1_3rd'.tr,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // [Plan Details]
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPlanFeature("ValuedMemberView_c2_1st".tr),
                  _buildPlanFeature("ValuedMemberView_c2_2nd".tr),
                  _buildPlanFeature("ValuedMemberView_c2_3rd".tr),
                  _buildPlanFeature("ValuedMemberView_c2_4th".tr),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // [Auto Renew Info]
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text("ValuedMemberView_c3_title".tr, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text(
                  "ValuedMemberView_c3_1st".tr,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  "ValuedMemberView_c3_2nd".tr,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  "ValuedMemberView_c3_3rd".tr,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Obx(
              () => TextField(
                onChanged: controller.onReferralCodeChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon:
                      controller.isButtonEnabled.value
                          ? GestureDetector(
                            onTap: controller.applyReferral,
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child:  Text(
                                "ValuedMemberView_textField_btn".tr,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          : Container(
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "ValuedMemberView_textField_btn".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  hintText: "ValuedMemberView_textField_hint".tr,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Obx(() {
              if (controller.referralStatusMessage.value.isEmpty)
                return SizedBox();

              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  controller.referralStatusMessage.value,
                  style: TextStyle(
                    color:
                        controller.isReferralApplied.value
                            ? Colors.green
                            : Colors.red,
                    fontSize: 14,
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),
            RoundButton(
              title: "ValuedMemberView_roundbtn".tr,
              onPress: () {
                Get.toNamed(RouteName.paymentView);
              },
              width: double.infinity,
            ),
            const SizedBox(height: 20),
             Text("ValuedMemberView_bottom".tr),
          ],
        ),
      ),
    );
  }
}
