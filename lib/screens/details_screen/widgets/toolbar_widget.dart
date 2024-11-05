import 'package:flutter/material.dart';
import 'package:affirmation_utility/configs/configs.dart';
import 'package:affirmation_utility/screens/details_screen/widgets/icon_widget.dart';

class ToolbarWidget extends StatelessWidget {
  const ToolbarWidget(
      {super.key,
      required this.onClose,
      required this.onShare,
      required this.onLeft,
      required this.onRight,
      required this.onFav,
      required this.isFav});
  final VoidCallback onClose;
  final VoidCallback onShare;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;
  final VoidCallback onFav;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 7,
        ),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.layer1,
            border: Border.all(color: AppColors.layer2)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconWidget(
            onTap: onFav,
            iconPath: isFav ? Assets.favFilled : Assets.fav,
          ),
          IconWidget(
            onTap: onLeft,
            iconPath: Assets.arrowLeft,
          ),
          IconWidget(
            onTap: onRight,
            iconPath: Assets.arrowRight,
          ),
          IconWidget(onTap: onShare, iconPath: Assets.share),
          IconWidget(onTap: onClose, iconPath: Assets.close),
        ]),
      ),
    );
  }
}
