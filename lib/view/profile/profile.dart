import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:ai_muspal/resource/Colors/app_colors.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:ai_muspal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ai_muspal/resource/asseets/image_assets.dart';
import 'package:get/get.dart';

import '../../View_Model/Controller/DeleteAccount/delete_account_Controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final DeleteAccountController controller = Get.put(DeleteAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title:  Text("ProfileView_title".tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile header
            Row(
              children: [
                SvgPicture.asset(ImageAssets.logo, width: 40, height: 40),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("johndoe@gmail.com", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Subscription section
             Text("ProfileView_Subscribe".tr, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            SvgPicture.asset(ImageAssets.profile_animation1, ),

            const SizedBox(height: 30),

            // Account Options Container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ProfileView_1st".tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  SizedBox(height: 20,),
                  Text("ProfileView_2nd".tr),

                  const Divider(),

                  Text("ProfileView_3rd".tr),
                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.lightGreenAccent,weight: 1,),
                      SizedBox(width: 10,),
                      Text("ProfileView_4th".tr),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.lightGreenAccent,weight: 1,),
                      SizedBox(width: 10,),
                      Text("ProfileView_5th".tr),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.lightGreenAccent,weight: 1,),
                      SizedBox(width: 10,),
                      Text("ProfileView_6th".tr),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.lightGreenAccent,weight: 1,),
                      SizedBox(width: 10,),
                      Text("ProfileView_7th".tr),
                    ],
                  ),
                  SizedBox(height: 20,),

                  RoundButton(title: "ProfileView_8th".tr, onPress: (){
                    Get.toNamed(RouteName.upgratemembershiftView);
                  },width: double.infinity,),

                ],
              ),
            ),

            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                   title: Text("ProfileView_9th".tr),
                    onTap: () {
                     Get.toNamed(RouteName.aboutView);
                    },
                  ),
                   const Divider(),
                  ListTile(
                    title: Text("ProfileView_10th".tr),
                    onTap: (){
                      Get.toNamed(RouteName.contactView);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: Text("ProfileView_11th".tr),
                    onTap: (){
                        Get.toNamed(RouteName.termsofServices);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: Text("ProfileView_12th".tr),
                    onTap: (){
                      Get.toNamed(RouteName.privacyView);
                    },
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("ProfileView_13th".tr),
                    onTap: (){
                      //Get.toNamed(RouteName.singoutView);
                      //showLogoutBottomSheet(context);
                      showiOSLogoutBottomSheet(context);
                    },
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("ProfileView_14th".tr),
                    onTap: (){
                     //Get.toNamed(RouteName.deleteAccountView);

                     // deleteAccountbottomsheet();

                      Get.put(DeleteAccountController()); // Register the controller
                      Get.bottomSheet(DeleteAccountBottomSheet());
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //sing out bottom sheet
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
            // First Box: Logout Confirmation
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'ProfileView_15th'.tr,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  const Divider(height: 1),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: perform logout logic here

                      Get.toNamed(RouteName.registerView);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child:  Text(
                        'ProfileView_16th'.tr,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Second Box: Cancel Button
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child:  Text(
                    'ProfileView_17th'.tr,
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

//delete account bottom sheet
class DeleteAccountBottomSheet extends StatelessWidget {
  final DeleteAccountController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.startCountdown(); // Start countdown when bottom sheet is built

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(
            'ProfileView_18th'.tr,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
           Text(
            'ProfileView_19th'.tr,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // DELETE button
          Obx(() {
            bool isEnabled = controller.isDeleteEnabled.value;
            return GestureDetector(
              onTap: isEnabled ? () {
                controller.deleteAccount();
                Get.back();
                Utils.snackBar("ProfileView_20th".tr, "ProfileView_21th".tr);
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
                  isEnabled
                      ? 'ProfileView_22th'.tr
                      : '${"ProfileView_23th".tr} (${controller.selectedCount})',
                  style: TextStyle(
                    color: isEnabled ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 12),

          // CANCEL button
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
              child:  Text(
                'ProfileView_24th'.tr,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

