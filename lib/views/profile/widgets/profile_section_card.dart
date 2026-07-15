import 'package:flutter/material.dart';
import '../../../core/widgets/section_card.dart';

/// Thin wrapper around the shared SectionCard widget,
/// kept separate so Profile screen sections stay easy to read.
class ProfileSectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const ProfileSectionCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(title: title, child: child);
  }
}
