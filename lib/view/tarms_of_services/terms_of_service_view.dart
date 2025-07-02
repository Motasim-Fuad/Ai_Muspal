import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfServiceView extends StatefulWidget {
  const TermsOfServiceView({super.key});

  @override
  State<TermsOfServiceView> createState() => _TermsOfServiceViewState();
}

class _TermsOfServiceViewState extends State<TermsOfServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("TermsOfServiceView_1st".tr,style: TextStyle(fontWeight: FontWeight.bold),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text("TermsOfServiceView_2nd".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_3rd".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_4th".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_5th".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_6th".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_7th".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_8th".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_9th".tr),
            ],
          ),
        ),
      )
    );
  }
}
