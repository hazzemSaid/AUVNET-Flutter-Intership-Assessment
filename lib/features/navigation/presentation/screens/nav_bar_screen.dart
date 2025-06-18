import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:ecommerce/features/navigation/presentation/widgets/nav_item_widget.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.onBackground,
        unselectedItemColor: Theme.of(context).colorScheme.onBackground,
        selectedLabelStyle: AppTextStyles.bodyMedium,
        unselectedLabelStyle: AppTextStyles.bodyMedium,
        items: List.generate(
          _pages.length,
          (index) => NavItemWidget(
            iconPath: _icons[index],
            label: _labels[index],
            isSelected: _selectedIndex == index,
          ),
        ),
      ),
    );
  }

  final List<String> _icons = [
    "assets/images/nawel.png",
    "assets/images/categories.png",
    "assets/images/deliver.png",
    "assets/images/cart.png",
    "assets/images/li_user.png",
  ];

  final List<String> _labels = [
    "Home",
    "Categories",
    "Deliver",
    "Cart",
    "Profile",
  ];
}
