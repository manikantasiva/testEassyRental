import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: EdgeInsets.only(
        left: 14,
        right: 14,
        top: 10,
        bottom:
            MediaQuery.of(context).padding.bottom + 10, 
      ),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            context: context,
            index: 0,
            icon: 'assets/icons/home_tab.png',
            label: 'Home',
            isSelected: selectedIndex == 0,
          ),
          _buildNavItem(
            context: context,
            index: 1,
            icon: 'assets/icons/calender_tab.png',
            label: 'Bookings',
            isSelected: selectedIndex == 1,
          ),
          _buildNavItem(
            context: context,
            index: 2,
            icon: "assets/icons/User.png",
            label: 'Profile',
            isSelected: selectedIndex == 2,
          ),
          _buildNavItem(
            context: context,
            index: 3,
            icon: "assets/icons/Notifications.png",
            label: 'Notifications',
            isSelected: selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required dynamic icon,
    required String label,
    required bool isSelected,
    bool isIcon = false,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:
              isSelected
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isIcon)
              Icon(
                icon as IconData,
                color: isSelected ? Colors.white : Colors.grey[400],
                size: 22,
              )
            else
              Image.asset(
                icon as String,
                width: 22,
                height: 22,
                color: isSelected ? Colors.white : Colors.grey[400],
              ),
          ],
        ),
      ),
    );
  }
}
