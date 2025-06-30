import 'package:ai_muspal/resource/App_routes/routes.dart';
import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:ai_muspal/resource/Colors/app_colors.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resource/asseets/image_assets.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(), // Pushes content down
              Column(
                children: [
                  const SizedBox(height: 20),


                         SvgPicture.asset(
                          ImageAssets.welcome,
                          height: 70,
                        ),
                  Text(
                    "WelcomeView_1st".tr,
                    style: TextStyle(
                      color: AppColor.prymaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "WelcomeView_2nd".tr,
                    style: TextStyle(color: AppColor.secondaryTextColor),
                  ),
                ],
              ),
              RoundButton(
                title: "WelcomeView_btn".tr,
                onPress: () {
                  Get.toNamed(RouteName.homeView);
                },
                width: double.infinity,
                buttonColor: AppColor.primaryButtonColor,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
