import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:ai_muspal/resource/Colors/app_colors.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ai_muspal/resource/asseets/image_assets.dart';
import 'package:get/get.dart';
import '../../../View_Model/Controller/upgreteMemberShift/referrer_controller.dart';

class PlatinumMemberView extends StatelessWidget {
  final ReferralController controller = Get.put(ReferralController());

  PlatinumMemberView({super.key});

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
            SvgPicture.asset(
              ImageAssets.platinumMember_animation2,
              height: 200,
            ),
            const SizedBox(height: 10),

            // [Membership Info]
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xfff9fceb),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffbfdc36)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'PlatinumMemberView_c1_1st'.tr,
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
                    children: const [
                      Text(
                        'HK\$477/月',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'HK\$273/月',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '(HK\$3,280/年)',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'PlatinumMemberView_c1_2nd'.tr,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  _buildPlanFeature("PlatinumMemberView_c2_1st".tr),
                  _buildPlanFeature("PlatinumMemberView_c2_2nd".tr),
                  _buildPlanFeature("PlatinumMemberView_c2_3rd".tr),
                  _buildPlanFeature("PlatinumMemberView_c2_4th".tr),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // [Auto Renew Info]
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PlatinumMemberView_c3_title".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  "PlatinumMemberView_c3_1st".tr,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  "PlatinumMemberView_c3_2nd".tr,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  "PlatinumMemberView_c3_3rd".tr,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // [Referral Code Input]
            Obx(
                  () => TextField(
                onChanged: controller.onReferralCodeChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: controller.isButtonEnabled.value
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
                      child: Text(
                        "PlatinumMemberView_textField_btn".tr,
                        style: const TextStyle(color: Colors.white),
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
                    child: Text(
                      "PlatinumMemberView_textField_btn".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  hintText: "PlatinumMemberView_textField_hint".tr,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),

            // [Referral Status Message]
            Obx(() {
              if (controller.referralStatusMessage.value.isEmpty)
                return SizedBox();

              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  controller.referralStatusMessage.value,
                  style: TextStyle(
                    color: controller.isReferralApplied.value
                        ? Colors.green
                        : Colors.red,
                    fontSize: 14,
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // [Start Trial Button]
            RoundButton(
              title: "PlatinumMemberView_roundbtn".tr,
              onPress: () {
                Get.toNamed(RouteName.paymentView);
              },
              width: double.infinity,
            ),

            const SizedBox(height: 20),

            // [Bottom Info]
            Text(
              "PlatinumMemberView_bottom".tr,
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
