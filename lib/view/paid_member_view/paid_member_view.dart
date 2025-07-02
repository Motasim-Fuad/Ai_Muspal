import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:ai_muspal/resource/Colors/app_colors.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:ai_muspal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ai_muspal/resource/asseets/image_assets.dart';
import 'package:get/get.dart';
import '../../View_Model/Controller/DeleteAccount/delete_account_Controller.dart';

class PaidMemberView extends StatefulWidget {
  const PaidMemberView({super.key});

  @override
  State<PaidMemberView> createState() => _PaidMemberViewState();
}

class _PaidMemberViewState extends State<PaidMemberView> {
  final DeleteAccountController controller = Get.put(DeleteAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ProfileView_title".tr),
      ),
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
                    const Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    const Text("johndoe@gmail.com", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text("ProfileView_Subscribe".tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            SvgPicture.asset(ImageAssets.valedMember_animation2),
            const SizedBox(height: 30),
            _buildAccountCard(),
            const SizedBox(height: 20),
            _buildNavigationCard(),
            const SizedBox(height: 20),
            _buildLogoutCard(),
            const SizedBox(height: 20),
            _buildDeleteCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ProfileView_1st".tr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
           Text("PaidMemberView_date".tr),
          const SizedBox(height: 20),
          Text("ProfileView_2nd".tr),
          const Divider(),
          Text("ProfileView_3rd".tr),
          _buildFeatureItem("ProfileView_4th".tr),
          _buildFeatureItem("ProfileView_5th".tr),
          _buildFeatureItem("ProfileView_6th".tr),
          _buildFeatureItem("ProfileView_7th".tr),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Text(
              "PaidMemberView_underline_btn".tr,
              style: TextStyle(
                color: Colors.red,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                fontWeight: FontWeight.bold,
                decorationThickness: 3,
              ),
            ),
          ),
          const SizedBox(height: 20),
          RoundButton(
            title: "ProfileView_8th".tr,
            onPress: () => Get.toNamed(RouteName.manageSubscriptionView),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Colors.lightGreenAccent),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }

  Widget _buildNavigationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        children: [
          ListTile(title: Text("ProfileView_9th".tr), onTap: () => Get.toNamed(RouteName.aboutView)),
          const Divider(),
          ListTile(title: Text("ProfileView_10th".tr), onTap: () => Get.toNamed(RouteName.contactView)),
          const Divider(),
          ListTile(title: Text("ProfileView_11th".tr), onTap: () => Get.toNamed(RouteName.termsofServices)),
          const Divider(),
          ListTile(title: Text("ProfileView_12th".tr), onTap: () => Get.toNamed(RouteName.privacyView)),
        ],
      ),
    );
  }

  Widget _buildLogoutCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: ListTile(
        title: Text("ProfileView_13th".tr),
        onTap: () => showiOSLogoutBottomSheet(context),
      ),
    );
  }

  Widget _buildDeleteCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: ListTile(
        title: Text("ProfileView_14th".tr),
        onTap: () => Get.bottomSheet(DeleteAccountBottomSheet()),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
      ],
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
                    child: Text("ProfileView_15th".tr, style: const TextStyle(fontSize: 14, color: Colors.grey)),
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
                      child: Text("ProfileView_16th".tr, style: const TextStyle(color: Colors.red, fontSize: 18)),
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
                  child: Text("ProfileView_17th".tr, style: const TextStyle(color: Colors.blue, fontSize: 18)),
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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("ProfileView_18th".tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("ProfileView_19th".tr, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Obx(() {
            final isEnabled = controller.isDeleteEnabled.value;
            return GestureDetector(
              onTap: isEnabled
                  ? () {
                controller.deleteAccount();
                Get.back();
                Utils.snackBar("ProfileView_20th".tr, "ProfileView_21th".tr);
              }
                  : null,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: isEnabled ? Colors.red : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  isEnabled
                      ? "ProfileView_22th".tr
                      : "${"ProfileView_23th".tr} (${controller.selectedCount})",
                  style: TextStyle(
                    color: isEnabled ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
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
              child: Text("ProfileView_24th".tr, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
