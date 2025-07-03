import 'package:ai_muspal/View_Model/Controller/chat_report_view_model/chat_report_view_model.dart';
import 'package:ai_muspal/view/chatReport_view/widget/audio_bar.dart';
import 'package:ai_muspal/view/chatReport_view/widget/scoreCard.dart';
import 'package:ai_muspal/view/chatReport_view/widget/sectionCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChatReportView extends GetView<ChatReportViewModel> {
  const ChatReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chatReport_title'.tr), centerTitle: true),
      body: Obx(() {
        final report = controller.report.value;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Score Circle
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.redAccent, width: 4),
                ),
                child: Column(
                  children: [
                    Text('chatReport_totalScore'.tr),
                    Text('${report.totalScore}',
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Score Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScoreCard(title: 'chatReport_pitch'.tr, score: report.pitchScore),
                  ScoreCard(title: 'chatReport_rhythm'.tr, score: report.rhythmScore),
                  ScoreCard(title: 'chatReport_dynamics'.tr, score: report.dynamicsScore),
                ],
              ),

              const SizedBox(height: 16),
              SectionCard(title: 'chatReport_comment'.tr, content: report.overallComment),
              const SizedBox(height: 16),

              SectionCard(
                title: 'chatReport_rhythm'.tr,
                contentWidget: Column(
                  children: [
                    const SizedBox(height: 8),
                    Text('chatReport_rhythmDetails'.tr),
                    const AudioBar(duration: '0:17'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              SectionCard(
                title: 'chatReport_dynamics'.tr,
                content: 'chatReport_dynamicsDetails'.tr,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.snackbar('chatReport_continue'.tr, 'chatReport_continue_msg'.tr),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text('chatReport_continue'.tr),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: Text('chatReport_back'.tr),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
