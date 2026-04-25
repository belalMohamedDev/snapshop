import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/presentation/screen/my_profile_screen.dart';
import 'package:snapshop/feature/profile/presentation/screen/orders_screen.dart';
import 'package:snapshop/feature/profile/presentation/screen/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  @override
  void initState() {
    super.initState();
    _loadName();
  }

  void _loadName() async {
    name = await SharedPrefHelper.getSecuredString(PrefKeys.userName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate("profile")),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        child: Column(
          children: [
            Center(child: Image.asset(ImageAsset.profile, width: 120.w)),
            SizedBox(height: 10.h),
            Text("$name", style: TextStyle(color: Colors.black87)),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfileScreen()),
                );
              },
              child: ListTile(
                leading: Icon(IconlyBold.profile),
                title: Text(context.translate("myProfile")),

                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            SizedBox(height: 15.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrdersScreen()),
                );
              },
              child: ListTile(
                leading: Icon(IconlyBold.bag),
                title: Text(context.translate("myOrders")),

                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            SizedBox(height: 15.h),
            ListTile(
              leading: Icon(IconlyBold.heart),
              title: Text(context.translate("wishList")),

              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 15.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: ListTile(
                leading: Icon(IconlyBold.setting),
                title: Text(context.translate("settings")),

                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),

            SizedBox(height: 10.h),
            ListTile(
              onTap: () async {
                await SharedPrefHelper.clearAllSecuredData();
                if (!context.mounted) return;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.loginRoute,
                  (route) => false,
                );
              },
              leading: Icon(IconlyBold.logout),
              title: Text(context.translate("logOut")),

              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
