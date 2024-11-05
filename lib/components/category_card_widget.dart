import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:affirmation_utility/configs/app_colors.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget(
      {super.key,
      required this.title,
      this.selected = false,
      required this.assetName,
      this.onTap});
  final String title;
  final bool selected;
  final String assetName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: selected == false
                ? null
                : Border.all(width: 2, color: AppColors.accentPrimary1),
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.layer3),
        child: Row(
          children: [
            SvgPicture.asset(
              assetName,
              height: 32,
              width: 32,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: selected == false
                      ? AppColors.textSecondary
                      : AppColors.textPrimary),
            )
          ],
        ),
      ),
    );
  }
}
