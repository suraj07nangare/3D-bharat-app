
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/info_chip.dart';
import '../../models/user_model.dart';
import 'widgets/profile_detail_row.dart';
import 'widgets/profile_section_card.dart';

/// Vertically scrollable Profile Details screen.
/// Uses dynamic API user data for name/age/image/location,
/// and static data for everything else.
class ProfileDetailsScreen extends StatelessWidget {
  final UserModel user;

  const ProfileDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 380,
            pinned: true,
            backgroundColor: AppColors.background,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(user.imageUrl,fit: BoxFit.cover),
                  // CachedNetworkImage(
                  //   imageUrl: user.imageUrl,
                  //   fit: BoxFit.cover,
                  // ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: AppColors.profileGradient,
                        stops: [0.55, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user.fullName}, ${user.age}",
                          style: const TextStyle(
                            color: AppColors.textLight,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${user.city}, ${user.state}, ${user.country}",
                          style: const TextStyle(
                            color: AppColors.textLight,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Row(
                  children: [
                    InfoChip(label: "92% Match", icon: Icons.favorite),
                    SizedBox(width: 8),
                    InfoChip(label: "88% Trust", icon: Icons.verified),
                  ],
                ),
                const SizedBox(height: 16),
                ProfileSectionCard(
                  title: AppStrings.about,
                  child: const Text(
                    "Adventure seeker, coffee lover, and always up for "
                    "spontaneous weekend trips. Looking for someone to "
                    "share good conversations and great food with.",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
                ProfileSectionCard(
                  title: AppStrings.theBasics,
                  child: Column(
                    children: [
                      ProfileDetailRow(
                        icon: Icons.height,
                        label: "Height",
                        value: "5'7\"",
                      ),
                      ProfileDetailRow(
                        icon: Icons.fitness_center,
                        label: "Body Type",
                        value: "Athletic",
                      ),
                      ProfileDetailRow(
                        icon: Icons.local_bar,
                        label: "Drinking",
                        value: "Socially",
                      ),
                      ProfileDetailRow(
                        icon: Icons.location_city,
                        label: "Location",
                        value: user.location,
                      ),
                    ],
                  ),
                ),
                ProfileSectionCard(
                  title: AppStrings.careerAndAmbition,
                  child: Column(
                    children: const [
                      ProfileDetailRow(
                        icon: Icons.work_outline,
                        label: "Profession",
                        value: "UX Designer",
                      ),
                      ProfileDetailRow(
                        icon: Icons.school_outlined,
                        label: "Education",
                        value: "Bachelor's Degree",
                      ),
                      ProfileDetailRow(
                        icon: Icons.trending_up,
                        label: "Ambition",
                        value: "Very Ambitious",
                      ),
                    ],
                  ),
                ),
                ProfileSectionCard(
                  title: AppStrings.interests,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      InfoChip(label: "Travel", icon: Icons.flight),
                      InfoChip(label: "Music", icon: Icons.music_note),
                      InfoChip(label: "Foodie", icon: Icons.restaurant),
                      InfoChip(label: "Yoga", icon: Icons.self_improvement),
                      InfoChip(label: "Movies", icon: Icons.movie),
                    ],
                  ),
                ),
                ProfileSectionCard(
                  title: AppStrings.lifestyle,
                  child: Column(
                    children: const [
                      ProfileDetailRow(
                        icon: Icons.pets,
                        label: "Pets",
                        value: "Dog Lover",
                      ),
                      ProfileDetailRow(
                        icon: Icons.smoking_rooms,
                        label: "Smoking",
                        value: "Non-smoker",
                      ),
                      ProfileDetailRow(
                        icon: Icons.self_improvement,
                        label: "Relationship Type",
                        value: "Long-term",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
