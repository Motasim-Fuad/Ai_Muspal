import 'package:flutter/material.dart';

class AudioBar extends StatelessWidget {
  final String duration;

  const AudioBar({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: 0.5,
            backgroundColor: Colors.grey.shade300,
            color: Colors.redAccent,
          ),
        ),
        const SizedBox(width: 8),
        Text(duration),
      ],
    );
  }
}