import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final String title;
  final int score;

  const ScoreCard({super.key, required this.title, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text('$score 分', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}