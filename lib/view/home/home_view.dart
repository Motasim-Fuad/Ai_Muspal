import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../resource/Colors/app_colors.dart';
import '../../resource/asseets/image_assets.dart';
import '../../resource/compunents/RoundButton.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {



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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteName.profileView);
                    },
                    child: SvgPicture.asset(
                      ImageAssets.logo,
                      height: 30,
                    ),
                  ),
                  SvgPicture.asset(
                    ImageAssets.home_text,
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteName.allChatListView);
                    },
                    child: SvgPicture.asset(
                      ImageAssets.home_chat,
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(), // Pushes content down
              Column(
                children: [
                  SvgPicture.asset(
                    ImageAssets.logo,
                    height: 70,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HomeView_1st".tr,
                        style: TextStyle(
                          color: AppColor.prymaryTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "HomeView_2nd".tr,
                        style: TextStyle(
                          color: AppColor.primaryButtonColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Text(
                    "HomeView_3rd".tr,
                    style: TextStyle(color: AppColor.secondaryTextColor),
                  ),

                  SvgPicture.asset(
                    ImageAssets.home_image,

                  ),

                ],
              ),

              RoundButton(
                title: "HomeView_4th".tr,
                onPress: () {
                  showAi_BottomSheet();
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

  void showAi_BottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.logo,
                        height: 20,
                      ),
          
                       Text(
                        "HomeView_5th".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
          
              const Divider(
                thickness: 1.2,
                color: Colors.grey,
              ),
          
              const SizedBox(height: 30),
              GestureDetector(
                onTap: (){
          
                  Get.toNamed(RouteName.music_chatView);
                },
                  child: SvgPicture.asset(ImageAssets.home_ai1)
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteName.violinAnalysisview);
                  },
                  child: SvgPicture.asset(ImageAssets.home_ai2)
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteName.pianoAnalysisView);
                  },
                  child: SvgPicture.asset(ImageAssets.home_ai3)
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

}
