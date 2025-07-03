import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreCard extends StatelessWidget {
  final String title; // This should be a localization key like 'chatReport_pitch'
  final int score;

  const ScoreCard({super.key, required this.title, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title.tr),
        Text('$score ${'chatReport_point'.tr}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
