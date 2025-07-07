import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/discover/presentation/views/discover_view.dart';
import 'package:grace_cycle/features/favorites/presentation/views/favorites_view.dart';
import 'package:grace_cycle/features/home/presentation/views/home_view.dart';
import 'package:grace_cycle/features/orders/presentation/views/orders_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = const <Widget>[
    HomeView(),
    DiscoverView(),
    FavoritesView(),
    OrdersView(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.vendorCard,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.vendorCard,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            _buildNavBarItem(Icons.home_outlined, 'Home', 0),
            _buildNavBarItem(Icons.search, 'Discover', 1),
            _buildNavBarItem(Icons.favorite_border_outlined, 'Favorites', 2),
            _buildNavBarItem(Icons.shopping_bag_outlined, 'Orders', 3),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index == 0)
            SvgPicture.asset(
              height: 20.h,
              width: 20.w,
              AppAssets.home,
              colorFilter: ColorFilter.mode(
                _selectedIndex == index ? AppColors.greenButt : Colors.black,
                BlendMode.srcIn,
              ),
            )
          else if (index == 3)
            SvgPicture.asset(
              height: 20.h,
              width: 20.w,
              AppAssets.order,
              colorFilter: ColorFilter.mode(
                _selectedIndex == index ? AppColors.greenButt : Colors.black,
                BlendMode.srcIn,
              ),
            )
          else
            Icon(
              icon,
              color:
                  _selectedIndex == index ? AppColors.greenButt : Colors.black,
              size: 26.sp,
            ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: _selectedIndex == index ? 14.sp : 14.sp,
              fontWeight: FontWeight.w400,
              color:
                  _selectedIndex == index ? AppColors.greenButt : Colors.black,
            ),
          ),
        ],
      ),
      label: '',
    );
  }
}
