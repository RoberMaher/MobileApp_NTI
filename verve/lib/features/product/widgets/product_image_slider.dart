// features/product/widgets/product_image_slider.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> images;
  final double height;
  final bool showFavorite;
  final bool showShare;

  const ProductImageSlider({
    super.key,
    required this.images,
    this.height = 400,
    this.showFavorite = true,
    this.showShare = true,
  });

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int currentIndex = 0;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          /// Slider
          CarouselSlider(
            options: CarouselOptions(
              height: widget.height,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() => currentIndex = index);
              },
            ),
            items: widget.images.map((img) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                  ),
                ),
              );
            }).toList(),
          ),

          /// Share
          if (widget.showShare)
            Positioned(
              top: 40,
              right: 16,
              child: const Icon(Icons.share, size: 26),
            ),

          /// Dots
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 10 : 6,
                  height: currentIndex == index ? 10 : 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.black : Colors.grey,
                  ),
                );
              }),
            ),
          ),

          /// Favorite
          if (widget.showFavorite)
            Positioned(
              bottom: 20,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  setState(() => isFav = !isFav);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
