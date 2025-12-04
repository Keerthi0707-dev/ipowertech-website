import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text(
          "© 2025 I Power Tech Generator Services. All rights reserved.",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
