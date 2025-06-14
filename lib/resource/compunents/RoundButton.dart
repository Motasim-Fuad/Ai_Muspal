import 'package:flutter/material.dart';
import '../Colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.prymaryTextColor,
    required this.title,
    required this.onPress,
    this.width = double.infinity,
    this.height = 50,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback? onPress; // Nullable!
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPress == null;

    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: GestureDetector(
        onTap: isDisabled ? null : onPress,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
