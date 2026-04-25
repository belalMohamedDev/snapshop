import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/cart/presentation/screen/cart_screen.dart';

class HomeHeader extends StatelessWidget {
  final String userName;

  const HomeHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.translate("helloBelal") ?? "Hello, Belal 👋",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              context.translate("welcomeToElminiawyPatisserie") ?? "Welcome to the SnapShop App",
              style: TextStyle(fontSize: 12.sp, color: Colors.black54),
            ),
          ],
        ),

        _circleIcon(
          icon: IconlyBold.bag,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _circleIcon({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20.sp),
      ),
    );
  }
}
