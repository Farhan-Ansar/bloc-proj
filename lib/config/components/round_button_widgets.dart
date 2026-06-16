import 'package:flutter/material.dart';

class RoundButtonWidgets extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;

  const RoundButtonWidgets({
    super.key,
    required this.title,
    required this.onPress,
    this.backgroundColor = Colors.orange,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
