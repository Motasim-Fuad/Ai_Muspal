// PremiumMemberView.dart - Localized version
import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:ai_muspal/resource/Colors/app_colors.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:ai_muspal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ai_muspal/resource/asseets/image_assets.dart';
import 'package:get/get.dart';

import '../../View_Model/Controller/DeleteAccount/delete_account_Controller.dart';

class PremiumMemberView extends StatefulWidget {
  const PremiumMemberView({super.key});

  @override
  State<PremiumMemberView> createState() => _PremiumMemberViewState();
}

class _PremiumMemberViewState extends State<PremiumMemberView> {
  final DeleteAccountController controller = Get.put(DeleteAccountController());
  final subscriptionController = Get.put(SubscriptionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('PremiumMemberView_title'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(ImageAssets.logo, width: 40, height: 40),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John Doe", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("johndoe@gmail.com", style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text('PremiumMemberView_subscribeTitle'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            SvgPicture.asset(ImageAssets.platinumMember_animation2,),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PremiumMemberView_planName'.tr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  const SizedBox(height: 20),
                  Text('PremiumMemberView_planDesc'.tr),
                  const Divider(),
                  Text('PremiumMemberView_planIncludes'.tr),
                  Row(children: [Icon(Icons.check_circle, color: Colors.lightGreenAccent), const SizedBox(width: 10), Text('PremiumMemberView_feature1'.tr)]),
                  Row(children: [Icon(Icons.check_circle, color: Colors.lightGreenAccent), const SizedBox(width: 10), Text('PremiumMemberView_feature2'.tr)]),
                  Row(children: [Icon(Icons.check_circle, color: Colors.lightGreenAccent), const SizedBox(width: 10), Text('PremiumMemberView_feature3'.tr)]),
                  Row(children: [Icon(Icons.check_circle, color: Colors.lightGreenAccent), const SizedBox(width: 10), Text('PremiumMemberView_feature4'.tr)]),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      bool result = await subscriptionController.handleManageSubscription();
                      if (result) {
                        Get.toNamed(RouteName.music_chatView);
                      } else {
                        Get.toNamed(RouteName.manageSubscriptionView);
                      }
                    },
                    child: Obx(() => Text(
                      subscriptionController.isSubscribed.value
                          ? 'PremiumMemberView_manage'.tr
                          : 'PremiumMemberView_upgrade'.tr,
                      style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        decorationColor: Colors.red,
                        decorationThickness: 3,
                      ),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildListTileSection([
              {'title': 'PremiumMemberView_about'.tr, 'route': RouteName.aboutView},
              {'title': 'PremiumMemberView_contact'.tr, 'route': RouteName.contactView},
              {'title': 'PremiumMemberView_terms'.tr, 'route': RouteName.termsofServices},
              {'title': 'PremiumMemberView_privacy'.tr, 'route': RouteName.privacyView},
            ]),
            const SizedBox(height: 20),
            _buildActionTile('PremiumMemberView_logout'.tr, () => showiOSLogoutBottomSheet(context)),
            const SizedBox(height: 20),
            _buildActionTile('PremiumMemberView_delete'.tr, () => Get.bottomSheet(DeleteAccountBottomSheet())),
          ],
        ),
      ),
    );
  }

  Widget _buildListTileSection(List<Map<String, dynamic>> items) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Column(
        children: items.map((item) => Column(
          children: [
            ListTile(title: Text(item['title']), onTap: () => Get.toNamed(item['route'])),
            const Divider(),
          ],
        )).toList(),
      ),
    );
  }

  Widget _buildActionTile(String title, VoidCallback onTap) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: ListTile(title: Text(title), onTap: onTap),
    );
  }

  void showiOSLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('PremiumMemberView_logoutConfirm'.tr, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ),
                  const Divider(height: 1),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed(RouteName.registerView);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text('PremiumMemberView_logout'.tr, style: const TextStyle(color: Colors.red, fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('PremiumMemberView_cancel'.tr, style: const TextStyle(color: Colors.blue, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteAccountBottomSheet extends StatelessWidget {
  final DeleteAccountController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.startCountdown();

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('PremiumMemberView_deleteConfirm'.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('PremiumMemberView_deleteDesc'.tr, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Obx(() {
            bool isEnabled = controller.isDeleteEnabled.value;
            return GestureDetector(
              onTap: isEnabled ? () {
                controller.deleteAccount();
                Get.back();
                Utils.snackBar("account delete", "Account delete successfully");
              } : null,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: isEnabled ? Colors.red : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  isEnabled ? 'PremiumMemberView_delete'.tr : '${'PremiumMemberView_delete'.tr} (${controller.selectedCount})',
                  style: TextStyle(color: isEnabled ? Colors.white : Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text('PremiumMemberView_cancel'.tr, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionController extends GetxController {
  RxBool isSubscribed = false.obs;

  Future<bool> handleManageSubscription() async {
    return true;
  }
}
