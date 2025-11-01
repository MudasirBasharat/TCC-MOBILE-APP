import 'package:flutter/material.dart';
import 'package:travel_clothing/widgets/onboarding_button.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Travel Light, Arrive in Style',
      description:
          'Browse curated collections at your destination — fashion, essentials, and lifestyle items ready when you arrive.',
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingData(
      title: 'Reserve What You Need',
      description:
          "Choose products in your size and style. We’ll prepare them for you before you land.",
      image: 'assets/images/onboarding2.png',
    ),
    OnboardingData(
      title: 'Delivered to Your Doorstep',
      description:
          'Your reserved items arrive at your hotel, Airbnb, or home ready to wear, stress-free.',
      image: 'assets/images/onboarding3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            physics: const ClampingScrollPhysics(),
            pageSnapping: true,
            itemBuilder: (context, index) {
              return RepaintBoundary(
                child: OnboardingPage(
                  title: _pages[index].title,
                  description: _pages[index].description,
                  currentPage: _currentPage,
                  totalPages: _pages.length,
                  image: _pages[index].image,
                ),
              );
            },
          ),
          // Bottom btn
          OnboardingButtons(
            currentPage: _currentPage,
            pageController: _pageController,
          ),
          // Skip btn
          if (_currentPage == 0)
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 16,
              child: OutlinedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEECD9),
                  side: const BorderSide(color: Color(0xFFF77F00), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Color.fromRGBO(247, 127, 0, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}
