import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'features/auth/views/profile_view.dart';
import 'features/cart/views/cart_view.dart';
import 'features/home/views/home_view.dart';
import 'features/order_history/views/order_history_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController _pageController;
  late int _currentView;

  final _screen = const [
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];

  final _items = const [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'Cart'),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_restaurant_rounded),
      label: 'Order History',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled, color: Colors.grey),
      label: 'Propfile',
    ),
  ];

  @override
  void initState() {
    _currentView = 0;
    _pageController = PageController(initialPage: _currentView);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentView == 3 ? AppColors.primary : null,
      body: PageView(
        clipBehavior: Clip.none,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screen,
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentView,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade600,
          backgroundColor: Colors.transparent,

          onTap: (index) {
            setState(() {
              _currentView = index;
            });

            _pageController.jumpToPage(_currentView);
          },
          items: _items,
        ),
      ),
    );
  }
}
