import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PrivacyView_title".tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph1".tr),
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph2".tr),
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph3".tr),
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph4".tr),
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph5".tr),
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph6".tr),
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph7".tr),
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph8".tr),
              const SizedBox(height: 30),
              Text("PrivacyView_paragraph9".tr),
            ],
          ),
        ),
      ),
    );
  }
}
