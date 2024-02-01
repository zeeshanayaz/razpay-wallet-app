// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/features/profile/presentations/views/profile.dart';
import 'package:razpay/features/home/presentations/views/home.dart';
import 'package:razpay/features/market/presentations/views/markets.dart';
import 'package:razpay/features/transactions/presentations/views/transactions.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../../profile/controller/profile_controller.dart';

class MainHomeNav extends StatefulWidget {
  const MainHomeNav({super.key});

  @override
  _MainHomeNavState createState() => _MainHomeNavState();
}

class _MainHomeNavState extends State<MainHomeNav> {
  final profileController = Get.put(ProfileController());

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MarketScreen(),
    const TransactionScreen(),
    const ProfileScreen(),
  ];

  List<BottomNavigationBarItem> _navItems(bool isDark) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(
          IconlyBold.home,
        ),
        activeIcon: const Icon(
          IconlyBold.home,
          color: primary,
        ),
        label: 'Home',
        backgroundColor: isDark ? darkbgColor : white,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          IconlyBold.bag,
        ),
        activeIcon: const Icon(
          IconlyBold.bag,
          color: primary,
        ),
        label: 'Market',
        backgroundColor: isDark ? darkbgColor : white,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Iconsax.activity,
        ),
        activeIcon: const Icon(
          Iconsax.activity,
          color: primary,
        ),
        label: 'Transactions',
        backgroundColor: isDark ? darkbgColor : white,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          IconlyBold.more_square,
        ),
        activeIcon: const Icon(
          IconlyBold.more_square,
          color: primary,
        ),
        label: 'More',
        backgroundColor: isDark ? darkbgColor : white,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDark ? darkbgColor : white,
        items: _navItems(isDark),
        currentIndex: _selectedIndex,
        selectedItemColor: primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
