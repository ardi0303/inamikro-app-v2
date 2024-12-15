import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 20.0, sigmaY: 20.0), // Apply blur effect to the background
        child: Container(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            color: AppPalette.white.withOpacity(
                0.5), // Semi-transparent white background with blur
          ),
          child: GNav(
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            gap: 6,
            activeColor: Colors.white,
            tabBackgroundColor: AppPalette.red,
            selectedIndex: selectedIndex, // Active tab index
            onTabChange: onTabChange, // Callback when tab changes
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.store,
                text: 'Tokoku',
              ),
              GButton(
                icon: LineIcons.dollyFlatbed,
                text: 'Kasir Cepat',
              ),
              GButton(
                icon: LineIcons.clock,
                text: 'Riwayat',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
