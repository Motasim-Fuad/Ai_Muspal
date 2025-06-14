import 'package:ai_muspal/resource/App_routes/routes_name.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(title: "Paid Member", onPress: (){
                Get.toNamed(RouteName.paidMemberView);
              }),
              SizedBox(height: 20,),
              RoundButton(title: "Premium Member", onPress: (){
                  Get.toNamed(RouteName.premiumMemberView);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
