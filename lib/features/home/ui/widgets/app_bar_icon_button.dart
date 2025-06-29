import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app/app_colors.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.onTap,
    required this.iconData, required this.color,
  });

  final VoidCallback onTap;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            iconData,
            color: color,
            size: 24,
          ),
        ),
      ),
    );
  }
}
