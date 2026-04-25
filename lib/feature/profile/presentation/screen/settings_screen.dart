import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/presentation/widget/customized_toggle.dart';

class SettingsScreen extends StatelessWidget {
  static final String routeName = "/settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate("settings")),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Row(
          children: [
            Text(
              context.translate("language"),
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const LanguageSwitch(),
          ],
        ),
      ),
    );
  }
}
