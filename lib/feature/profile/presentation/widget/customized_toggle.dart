import 'package:snapshop/core/common/shared/shared_imports.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  bool isEnglish = true;

  @override
  void initState() {
    super.initState();
    final localeString = context.read<AppLogicCubit>().currentLangCode;
    isEnglish = localeString != 'ar';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnglish = !isEnglish;
          if (isEnglish) {
            context.read<AppLogicCubit>().toEnglish();
          } else {
            context.read<AppLogicCubit>().toArabic();
          }
        });
      },
      child: Container(
        width: 90,
        height: 36,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: isEnglish ? Colors.transparent : Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  "AR",
                  style: TextStyle(
                    color: isEnglish ? Colors.white : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: isEnglish ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  "EN",
                  style: TextStyle(
                    color: isEnglish ? Colors.white : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
