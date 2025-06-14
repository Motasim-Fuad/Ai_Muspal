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
        title: const Text("管理訂閱"),
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
                    const Text("你的訂閱", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text("白金會員", style: TextStyle(fontSize: 16)),

                    const SizedBox(height: 20),
                    const Text("付費計劃", style: TextStyle(fontWeight: FontWeight.bold)),

                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("年費"),
                        Text("HK\$2,862"),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Divider(color: Colors.grey, height: 1),
                    const SizedBox(height: 20),

                    const Text(
                      "從 8 月 24 日開始，您的計劃將以每月 480 港元的正常價格續訂，直至取消。",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),

              const Spacer(), // Push button to the bottom

              RoundButton(
                textColor: Colors.black,
                title: "取消訂閱",
                onPress: () {

                showDialog(context: (context), builder: (context){
                  return CupertinoAlertDialog(
                    title:const  Text("確認取消"),
                    content: const Text("如果您現在確認並結束訂閱，您仍然可以在 2024 年 9 月 24 日之前使用服務"),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("現在不要",style: TextStyle(color: AppColor.primaryButtonColor),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),

                      CupertinoDialogAction(
                          isDefaultAction: true,
                        child: Text("確認",style: TextStyle(color: AppColor.primaryButtonColor),),
                        onPressed: () {

                          Navigator.of(context).pop();
                          Get.toNamed(RouteName.profileView);
                        },
                      ),
                    ],
                  );
                });
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
