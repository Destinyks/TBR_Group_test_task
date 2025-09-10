import 'package:flutter/material.dart';
import 'package:spacex_launches/core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == currentIndex ? 10 : 8,
          height: index == currentIndex ? 10 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 1.0),
            color: index == currentIndex
                ? AppColors.white
                : AppColors.transparent,
          ),
        );
      }),
    );
  }
}
