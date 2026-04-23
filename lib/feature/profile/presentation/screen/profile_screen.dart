import 'package:snapshop/core/common/shared/shared_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        child: Column(
          children: [
            Center(child: Image.asset(ImageAsset.profile, width: 120.w)),
            SizedBox(height: 10.h),
            Text("User full Name", style: TextStyle(color: Colors.black87)),
            SizedBox(height: 20.h),
            ListTile(
              leading: Icon(IconlyBold.profile),
              title: Text("My Profile"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 15.h),
            ListTile(
              leading: Icon(IconlyBold.bag),
              title: Text("My Orders"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 15.h),
            ListTile(
              leading: Icon(IconlyBold.heart),
              title: Text("My Favorites"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 15.h),
            ListTile(
              leading: Icon(IconlyBold.setting),
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),

            SizedBox(height: 10.h),
            ListTile(
              leading: Icon(IconlyBold.logout),
              title: Text("Log Out"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
