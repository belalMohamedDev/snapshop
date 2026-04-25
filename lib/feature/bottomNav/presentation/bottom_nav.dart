import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/category/presentation/screen/category_screen.dart';
import 'package:snapshop/feature/home/presentation/screen/home_screen.dart';
import 'package:snapshop/feature/profile/presentation/screen/profile_screen.dart';

enum _SelectedTab { home, items, profile }

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryScreen(),
    // const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_SelectedTab.values.indexOf(_selectedTab)],
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        // indicatorColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black.withValues(alpha: 0.9),
        // outlineBorderColor: Colors.black.withOpacity(0.1),
        borderWidth: 2,
        outlineBorderColor: Colors.white,
        onTap: _handleIndexChanged,
        paddingR: EdgeInsets.only(left: 20, right: 20),
        items: [
          /// Home
          CrystalNavigationBarItem(
            icon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            selectedColor: Colors.white,
          ),

          // /// category
          CrystalNavigationBarItem(
            icon: IconlyBold.category,
            unselectedIcon: IconlyLight.category,
            selectedColor: Colors.white,
          ),

          /// Favourite
          // CrystalNavigationBarItem(
          //   icon: IconlyBold.bag,
          //   unselectedIcon: IconlyLight.bag,
          //   selectedColor: Colors.white,
          // ),

          /// profile
          CrystalNavigationBarItem(
            icon: IconlyBold.profile,
            unselectedIcon: IconlyLight.profile,
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
