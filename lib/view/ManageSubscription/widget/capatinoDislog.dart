import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDialogButton extends StatelessWidget {
  const CupertinoDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      child: const Text('Cupertino Dialog'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title:  Text('確認取消'),
              content: const Text(
                'Are you sure you want to delete your account? This action cannot be undone!',
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('Delete'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        );
      },
    );
  }
}