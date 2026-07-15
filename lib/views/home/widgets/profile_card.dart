import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/info_chip.dart';
import '../../../models/user_model.dart';

/// Large swipeable profile card shown on the Home screen.
/// Tapping the card opens the Profile Details screen.
/// Tapping the rose button opens the Compliment bottom sheet.
class ProfileCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback onCardTap;
  final VoidCallback onRoseTap;

  const ProfileCard({
    super.key,
    required this.user,
    required this.onCardTap,
    required this.onRoseTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              user.imageUrl,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Container(color: AppColors.chipBackground);
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.chipBackground,
                  child: const Icon(Icons.person, size: 80),
                );
              },
            ),
            // Gradient overlay for text readability
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.profileGradient,
                  stops: [0.5, 1.0],
                ),
              ),
            ),
            // Match / trust chips top area
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                children: const [
                  InfoChip(
                    label: "92% Match",
                    icon: Icons.favorite,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 8),
                  InfoChip(
                    label: "88% Trust",
                    icon: Icons.verified,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
            // Bottom info + rose button
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user.firstName}, ${user.age}",
                          style: const TextStyle(
                            color: AppColors.textLight,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.textLight,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                user.location,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.textLight,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${AppStrings.replyTime} ~5 mins",
                          style: TextStyle(
                            color: AppColors.textLight.withOpacity(0.85),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: onRoseTap,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.local_florist,
                        color: AppColors.textLight,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
