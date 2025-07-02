import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:ai_muspal/resource/Colors/app_colors.dart';
import 'package:ai_muspal/view/ManageSubscription/widget/capatinoDislog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resource/compunents/RoundButton.dart';

class ManageSubscriptionView extends StatelessWidget {
  const ManageSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("ManageSubscriptionView_title".tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: media.size.height * 0.03),

              Container(
                width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ManageSubscriptionView_1st".tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("ManageSubscriptionView_2nd".tr, style: const TextStyle(fontSize: 16)),

                    const SizedBox(height: 20),
                    Text("ManageSubscriptionView_3rd".tr, style: const TextStyle(fontWeight: FontWeight.bold)),

                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ManageSubscriptionView_4th".tr),
                        Text("ManageSubscriptionView_5th".tr),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Divider(color: Colors.grey, height: 1),
                    const SizedBox(height: 20),

                    Text(
                      "ManageSubscriptionView_6th".tr,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              RoundButton(
                textColor: Colors.black,
                title: "ManageSubscriptionView_btn".tr,
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("ManageSubscriptionView_alertTitle".tr),
                        content: Text("ManageSubscriptionView_alertContent".tr),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("ManageSubscriptionView_alertCancel".tr,
                                style: const TextStyle(color: AppColor.primaryButtonColor)),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: Text("ManageSubscriptionView_alertConfirm".tr,
                                style: const TextStyle(color: AppColor.primaryButtonColor)),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Get.toNamed(RouteName.profileView);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(height: media.size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
