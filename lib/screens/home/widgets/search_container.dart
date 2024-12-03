import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suzanne_app/utilis/constants/colors.dart';
import 'package:suzanne_app/utilis/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackgorund = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackgorund, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: showBackgorund
              ? dark
                  ? SColor.dark
                  : SColor.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
          border: showBorder ? Border.all(color: Colors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color.fromARGB(255, 90, 89, 89),
            ),
            const SizedBox(
              width: 24.0,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
