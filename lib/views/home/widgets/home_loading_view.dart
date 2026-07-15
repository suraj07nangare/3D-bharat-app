import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Simple centered loading indicator shown while
/// the Home screen is fetching users.
class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primary),
    );
  }
}
