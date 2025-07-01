import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ContactView_1st".tr,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("ContactView_2nd".tr),
            SizedBox(height: 30,),

            Text("ContactView_3rd".tr,style: TextStyle(fontWeight: FontWeight.bold),),
            Text("support@gmail.com"),
          ],
        ),
      )
    );
  }
}
