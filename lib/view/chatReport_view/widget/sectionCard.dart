import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? contentWidget;

  const SectionCard({
    super.key,
    required this.title,
    this.content,
    this.contentWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          contentWidget ?? Text(content ?? ''),
        ],
      ),
    );
  }
}