
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resource/asseets/image_assets.dart';
import 'widget/emailContinueBtN.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
              SvgPicture.asset(
                ImageAssets.register1,
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
              Text("繼續操作即表示您自動同意 AI Muspal 的使用條款和隱私權政策。",style: TextStyle(fontSize: 10),),
            ],
          ),
        ),
      )
    );
  }
}
