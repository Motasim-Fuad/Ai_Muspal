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
      appBar: AppBar(title: const Text('報告分析'), centerTitle: true),
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
                    const Text('總評分'),
                    Text('${report.totalScore}', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Score Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScoreCard(title: '音準', score: report.pitchScore),
                  ScoreCard(title: '節拍', score: report.rhythmScore),
                  ScoreCard(title: '強弱變化', score: report.dynamicsScore),
                ],
              ),

              const SizedBox(height: 16),
              SectionCard(title: '整體評語', content: report.overallComment),
              const SizedBox(height: 16),

              SectionCard(
                title: '節拍',
                contentWidget: Column(
                  children: [
                   // Image.asset('assets/sheet_music.png'),
                    const SizedBox(height: 8),
                    const Text('學習音樂理論的基礎...（省略）'),
                    const AudioBar(duration: '0:17'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              SectionCard(
                title: '強弱變化',
                content: '樂句通常是音樂中的一句完整表達...',
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.snackbar('繼續對話', '功能未實作'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('繼續對話'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text('返回'),
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