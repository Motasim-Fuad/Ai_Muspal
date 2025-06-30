
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../View_Model/Controller/localization_togoleController.dart';
import '../../../resource/asseets/image_assets.dart';
import 'widget/emailContinueBtN.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {


  final LocalizationToggoleController localizationController = Get.put(
    LocalizationToggoleController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *0.7,
                    child: SvgPicture.asset(
                      ImageAssets.register1,
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width *0.12,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Obx(
                          () => GestureDetector(
                        onTap: localizationController.flagChange,
                        child: CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.transparent,
                          child: localizationController.language.value
                              ? Image.asset(
                            ImageAssets.chinaFlagPng, // PNG
                            height: 20,
                            width: 20,
                          )
                              : SvgPicture.asset(
                            ImageAssets.usFlag, // SVG
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),

                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageAssets.register2,
                  ),
                  SizedBox(width: 10,),
                  SvgPicture.asset(
                    ImageAssets.register3,
                  ),
                  SizedBox(width: 10,),
                  SvgPicture.asset(
                    ImageAssets.register4,
                  ),
                ],
              ),
        
              SvgPicture.asset(
                ImageAssets.register5,
              ),
        
              SizedBox(
                child:Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        ImageAssets.register6,
                        height: 300,
                      ),
                    ),
                    Container(
                      child: Image.asset(ImageAssets.register,height: 400,),
                    ),
                  ],
                ),
              ),
        
              EmailContinueButton(),
              Text("registerView_btm".tr,style: TextStyle(fontSize: 10),),
            ],
          ),
        ),
      )
    );
  }
}
