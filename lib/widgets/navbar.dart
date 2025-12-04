import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NavBar extends StatelessWidget {
  final Function(int) onItemSelected;
  final int selectedIndex;

  const NavBar({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final items = ["Home", "Services", "About", "Contact"];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "I Power Tech",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: List.generate(items.length, (index) {
              final isSelected = index == selectedIndex;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () => onItemSelected(index),
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: isSelected ? AppColors.accent : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
