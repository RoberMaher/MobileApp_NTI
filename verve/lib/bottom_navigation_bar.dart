// bottom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verve/core/constants/app_colors.dart';
import 'package:verve/features/Favorites/views/favorites_view.dart';
import 'package:verve/features/Search%20&%20Menu/views/search_view.dart';
import 'package:verve/features/auth/views/profile_view.dart';
import 'package:verve/features/cart/views/cart_view.dart';
import 'package:verve/features/home/views/home_view.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/bottom_navigation_bar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() =>
      _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController pageController;
  int currentScreen = 0;

  final List<Widget> pages = [
    HomeView(),
    SearchView(),
    FavoritesView(),
    CartView(),
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentScreen);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            currentScreen = index;
          });
        },
        itemBuilder: (context, index) => pages[index],
        physics: NeverScrollableScrollPhysics(),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: currentScreen,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.transparent,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],

            onTap: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
    );
  }
}
