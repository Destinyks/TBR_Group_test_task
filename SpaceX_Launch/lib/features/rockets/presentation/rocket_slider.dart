import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:spacex_launches/core/theme/app_colors.dart';

class RocketSlider extends StatefulWidget {
  final List<String> images;
  final Function(int) onPageChanged;

  const RocketSlider({
    super.key,
    required this.images,
    required this.onPageChanged,
  });

  @override
  State<RocketSlider> createState() => _RocketSliderState();
}

class _RocketSliderState extends State<RocketSlider> {
  late final PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.78, initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildImage(String? url, bool isSelected) {
    final imageWidget = (url == null || url.isEmpty)
        ? Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover)
        : CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, _) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, _, __) =>
                Image.asset('assets/images/placeholder.jpg'),
            fit: BoxFit.cover,
          );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(
        horizontal: isSelected ? 6 : 12,
        vertical: isSelected ? 0 : 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: imageWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        onPageChanged: (index) {
          setState(() => currentPage = index);
          widget.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          final isSelected = index == currentPage;
          return _buildImage(widget.images[index], isSelected);
        },
      ),
    );
  }
}
