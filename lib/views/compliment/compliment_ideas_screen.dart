import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/info_chip.dart';

/// Static compliment ideas screen with selectable suggestion cards.
class ComplimentIdeasScreen extends StatefulWidget {
  const ComplimentIdeasScreen({super.key});

  @override
  State<ComplimentIdeasScreen> createState() => _ComplimentIdeasScreenState();
}

class _ComplimentIdeasScreenState extends State<ComplimentIdeasScreen> {
  int _selectedCategory = 0;
  int? _selectedCompliment;

  final List<String> _categories = ["Sweet", "Funny", "Classy", "Bold"];

  final List<String> _compliments = [
    "Your smile is absolutely contagious, I can't stop smiling too!",
    "You have the best taste in music, we need to make a playlist together.",
    "Your profile made my day so much better, thank you for that.",
    "I love how genuine and down to earth you seem.",
    "You seem like the kind of person who gives the best hugs.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          AppStrings.complimentIdeas,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return InfoChip(
                  label: _categories[index],
                  selected: _selectedCategory == index,
                  onTap: () => setState(() => _selectedCategory = index),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _compliments.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final isSelected = _selectedCompliment == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCompliment = index),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.divider,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _compliments[index],
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textPrimary,
                              height: 1.4,
                            ),
                          ),
                        ),
                        if (isSelected)
                          const Icon(Icons.check_circle,
                              color: AppColors.primary),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedCompliment == null
                    ? null
                    : () => Navigator.pop(context),
                child: const Text(AppStrings.useThisCompliment),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
