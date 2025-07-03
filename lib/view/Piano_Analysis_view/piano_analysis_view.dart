import 'package:ai_muspal/resource/asseets/image_assets.dart';
import 'package:ai_muspal/resource/compunents/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../resource/App_routes/routes_name.dart';

class PianoAnalysisView extends StatefulWidget {
  const PianoAnalysisView({super.key});

  @override
  State<PianoAnalysisView> createState() => _PianoAnalysisViewState();
}

class _PianoAnalysisViewState extends State<PianoAnalysisView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pianoAnalysis_title".tr),
        centerTitle: true,
        actions: [
          SvgPicture.asset(ImageAssets.logo, height: 30),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Centered SVG Image
            Center(
              child: SvgPicture.asset(
                ImageAssets.analyze2,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),

            const Spacer(flex: 3),

            // Button at the bottom
            SizedBox(
              width: double.infinity,
              child: RoundButton(
                title: "pianoAnalysis_button".tr,
                onPress: () {
                  Get.toNamed(RouteName.pianoAnalysisChatView);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
