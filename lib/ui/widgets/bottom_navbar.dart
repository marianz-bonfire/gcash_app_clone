import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';
import 'package:gcash_app_clone/core/providers/navbar_provider.dart';
import 'package:gcash_app_clone/data/labels.dart';

class BottomNavBar extends StatelessWidget implements PreferredSizeWidget {
  final NavBarProvider navBarProvider;
  const BottomNavBar({
    super.key,
    required this.navBarProvider,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.primaryDarkerColor,
      unselectedItemColor: Colors.grey,
      currentIndex: navBarProvider.selectedNavIndex,
      onTap: (index) {
        navBarProvider.setSelectedNavIndex(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: Labels.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.inbox),
          label: Labels.inbox,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.qr_code_scanner),
          label: Labels.qr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.receipt),
          label: Labels.transactions,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: Labels.profile,
        ),
      ],
    );
  }
}
