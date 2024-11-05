import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:affirmation_utility/configs/configs.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.iconPath, required this.onTap});
  final String iconPath;

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 44,
        width: 44,
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
                onTap == null
                    ? AppColors.accentPrimary1.withOpacity(0.5)
                    : AppColors.accentPrimary1,
                BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
