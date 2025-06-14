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
      appBar: AppBar(centerTitle: true, title: const Text("帳戶")),
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
            const Text("訂閱", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            SvgPicture.asset(ImageAssets.valedMember_animation2, ),

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
                  Text("尊貴會員",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  Text("試用期到DD/MM/YY"),
                  SizedBox(height: 20,),
                  Text("你現在正在使用尊貴會員計劃，盡情享受暢通無阻的AI體驗"),

                  const Divider(),

                  Text("計劃包括"),
                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.lightGreenAccent,weight: 1,),
                      SizedBox(width: 10,),
                      Text("每月100條訊息"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.lightGreenAccent,weight: 1,),
                      SizedBox(width: 10,),
                      Text("每條訊息最多 1,000 字"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.lightGreenAccent,weight: 1,),
                      SizedBox(width: 10,),
                      Text("每月最多4小時的AI音頻評分"),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.lightGreenAccent,weight: 1,),
                      SizedBox(width: 10,),
                      Text("每月300份音樂分析報告"),
                    ],
                  ),



                  SizedBox(height: 20,),

                  GestureDetector(
                    onTap: (){

                    },
                    child: Text("管理訂閱",style: TextStyle(color: Colors.red,decoration: TextDecoration.underline,   decorationColor: Colors.red,fontWeight: FontWeight.bold,decorationThickness: 3 ),),
                  ),
                  SizedBox(height: 20,),
                  RoundButton(title: "升級會員", onPress: (){
                    Get.toNamed(RouteName.manageSubscriptionView);

                  }),


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
                    title: Text("關於我們"),
                    onTap: () {
                      Get.toNamed(RouteName.aboutView);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: Text("聯絡我們"),
                    onTap: (){
                      Get.toNamed(RouteName.contactView);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: Text("服務條款"),
                    onTap: (){
                      Get.toNamed(RouteName.termsofServices);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: Text("隱私"),
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
                    title: Text("登出"),
                    onTap: (){

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
                    title: Text("刪除帳戶"),
                    onTap: (){


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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      '你確定你要登出嗎？',
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
                      child: const Text(
                        '登出',
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
                  child: const Text(
                    '取消',
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
          const Text(
            '您確定要永久刪除您的帳戶嗎？',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            '與您帳戶關聯的所有資料都將被刪除且無法恢復。',
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
                  isEnabled
                      ? '刪除帳戶'
                      : '刪除帳戶 (${controller.selectedCount})',
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
              child: const Text(
                '取消',
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

