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
                        '年費計劃',
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
                        'HK\$238.5/月',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '(HK\$2,862/年)',
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
                  _buildPlanFeature("每月100條訊息"),
                  _buildPlanFeature("每條訊息最多 1,000 字"),
                  _buildPlanFeature("每月最多4小時的AI音頻評分"),
                  _buildPlanFeature("每月300份音樂分析報告"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // [Auto Renew Info]
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("自動續費說明", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text(
                  "1. 付款：“連續包月/季/年”商品為自動續費商品，確認購買後，會從您的蘋果iTunes帳戶扣費；",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  "2. 續費：在您訂閱到期前24小時，蘋果會自動從iTunes帳戶扣費，成功後會員有效期自動延長；",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  "3. 如需取消自動續費，請在訂閱到期前至少24小時，手動在Apple ID帳戶設置中關閉自動續費，關閉後不再扣費。",
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
                              child: const Text(
                                "套用",
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
                            child: const Text(
                              "套用",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  hintText: "輸入推薦碼",
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
              title: "開始 3 天免費試用",
              onPress: () {
                Get.toNamed(RouteName.paymentView);
              },
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            const Text("訂閱後，你將被自動扣除HK\$ 6528/年，你可以透過App store取消式管理訂閱。使用條款 。"),
          ],
        ),
      ),
    );
  }
}
