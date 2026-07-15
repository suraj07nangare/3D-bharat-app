import 'package:dataing_app_ui/core/widgets/notification_page.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import 'info_chip.dart';

/// Top header shown on the Home screen.
/// Contains menu icon, "Daily 25" chip, filter icon, and notification icon.
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onFilterTap;
  final VoidCallback? onNotificationTap;

  const AppHeader({
    super.key,
    this.onMenuTap,
    this.onFilterTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            GestureDetector(
              onTap: onMenuTap,
              child: const Icon(Icons.menu, color: AppColors.textPrimary),
            ),
            const SizedBox(width: 12),
            const InfoChip(
              label: AppStrings.dailyLabel,
              icon: Icons.local_fire_department,
            ),
            const Spacer(),
            GestureDetector(
              onTap: onFilterTap,
              child: const Icon(Icons.tune, color: AppColors.textPrimary),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: onNotificationTap,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
