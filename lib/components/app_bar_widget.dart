import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:affirmation_utility/configs/app_colors.dart';
import 'package:affirmation_utility/configs/assets.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key, required this.title, this.child, this.onLeading});
  final String title;
  final Widget? child;
  final VoidCallback? onLeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: AppColors.layer2)),
          color: AppColors.layer1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: onLeading != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (onLeading != null)
                  InkWell(
                    onTap: () {
                      onLeading?.call();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset(Assets.arrowLeft),
                    ),
                  ),
                Text(
                  title,
                  style: onLeading == null
                      ? Theme.of(context).textTheme.titleLarge
                      : Theme.of(context).textTheme.titleSmall,
                ),
                if (onLeading != null)
                  const SizedBox(
                    width: 50,
                  )
              ],
            ),
          ),
          if (child != null) SizedBox(height: 66, child: child!)
        ],
      ),
    );
  }
}
