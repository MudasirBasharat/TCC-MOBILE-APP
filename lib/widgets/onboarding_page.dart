import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  static const _titleStyle = TextStyle(
    fontFamily: 'RobotoSerif',
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(35, 35, 35, 1),
  );

  static const _descriptionStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Color.fromRGBO(108, 108, 108, 1),
    height: 1.5,
  );

  static const _containerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );
  final String title;
  final String description;
  final String image;
  final int currentPage;
  final int totalPages;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.currentPage,
    this.totalPages = 3,
  });

  Widget buildDotIndicators(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index
                ? const Color.fromRGBO(247, 127, 0, 1)
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final safeHeight = size.height - padding.top - padding.bottom;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height:
                safeHeight * 0.6, // Increased height to show more of the image
            width: size.width,
            child: Image.asset(
              image,
              fit: BoxFit.contain, // Changed to contain to show the full image
              filterQuality: FilterQuality.high,
            ),
          ),

          Container(
            height:
                safeHeight * 0.4, // Decreased height for the content section
            width: size.width,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
              vertical: safeHeight * 0.03,
            ),
            decoration: _containerDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: buildDotIndicators(context)),
                SizedBox(height: safeHeight * 0.04),
                Text(
                  title,
                  style: _titleStyle.copyWith(fontSize: size.width * 0.06),
                ),
                SizedBox(height: safeHeight * 0.02),
                Text(
                  description,
                  style: _descriptionStyle.copyWith(
                    fontSize: size.width * 0.04,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
