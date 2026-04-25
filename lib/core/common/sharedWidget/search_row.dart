import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/search/search_view.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);
    final bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    return InkWell(
      onTap: () {
        // Navigate to the search screen when the row is tapped

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchView()),
        );
      },
      child: Row(
        children: [
          // The search input field which is disabled but acts as a visual element
          Expanded(
            child: SizedBox(
              height: responsive.setHeight(5.5),
              child: TextFormField(
                enabled: false, // Disable the field since it's just for display
                decoration: InputDecoration(
                  hintText: "Search any Product..", // Placeholder text
                  prefixIcon: Icon(
                    IconlyBroken.search,
                    size: responsive.setIconSize(5),
                    color: Colors.black87, // Icon color for the search
                  ),

                  hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: responsive.setTextSize(3.5),
                    color: Colors.black54, // Color for the hint text
                  ),
                  fillColor: ColorManger
                      .backgroundItem, // Background color for the input field
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManger.backgroundItem),
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(
                        responsive.setBorderRadius(2),
                        responsive.setBorderRadius(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // A container holding the filter button
          Container(
            height: responsive.setHeight(5.5), // Match the search field height
            margin: responsive.setMargin(
              right: isEnLocale ? null : 2,
              left: isEnLocale ? 2 : null,
            ), // Margin for spacing
            decoration: BoxDecoration(
              color: Colors.black87, // Background color for the filter button
              borderRadius: BorderRadius.circular(
                responsive.setBorderRadius(2),
              ),
            ),
            child: IconButton(
              icon: Icon(
                IconlyBroken.filter, // Icon representing the filter
                color: ColorManger.white, // White color for the filter icon
              ),
              onPressed: () {
                // Navigate to the search screen when the filter button is tapped.
                Navigator.of(
                  context,
                  rootNavigator: !false,
                ).pushNamed(Routes.search);
              },
            ),
          ),
        ],
      ),
    );
  }
}
