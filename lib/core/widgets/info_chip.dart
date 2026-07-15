import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// A small pill-shaped chip used to show info like
/// match %, trust %, reply time, category filters, etc.
class InfoChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final bool selected;
  final VoidCallback? onTap;

  const InfoChip({
    super.key,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = selected
        ? AppColors.primary
        : (backgroundColor ?? AppColors.chipBackground);
    final txtColor =
        selected ? AppColors.textLight : (textColor ?? AppColors.textPrimary);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: txtColor),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                color: txtColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
