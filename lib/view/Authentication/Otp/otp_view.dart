
import 'package:ai_muspal/view/Authentication/Otp/widget/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("輸入6位數驗證碼",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text("我們已發送驗證碼到Johnxxx@gmail.com",style: TextStyle(fontSize: 15,)),
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



