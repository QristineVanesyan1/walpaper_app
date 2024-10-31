import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WallpaperImage extends StatelessWidget {
  const WallpaperImage({super.key, required this.link, this.onTap});
  final String link;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            child: _Shimmer(),
          ),
          Positioned(
            child: Image.network(
              link,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const _Shimmer();
              },
              errorBuilder: (context, exception, stackTrace) {
                return const _Shimmer();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Shimmer extends StatelessWidget {
  const _Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        highlightColor: const Color(0xff868686),
        baseColor: const Color(0xff373839),
        child: Container(
          color: const Color(0xff373839),
        ));
  }
}
