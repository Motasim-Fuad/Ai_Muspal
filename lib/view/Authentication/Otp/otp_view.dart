
import 'package:ai_muspal/view/Authentication/Otp/widget/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  Padding(
                    padding:  EdgeInsets.only(left: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("OtpView_1st".tr,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text("OtpView_2nd".tr,style: TextStyle(fontSize: 15,)),
                      ],
                    ),
                  ),



                   OtpForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



