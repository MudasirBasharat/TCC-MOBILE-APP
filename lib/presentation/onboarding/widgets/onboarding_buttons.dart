import 'package:flutter/material.dart';

class OnboardingButtons extends StatelessWidget {
  final int currentPage;
  final PageController pageController;

  const OnboardingButtons({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: size.height * 0.05,
      left: size.width * 0.05,
      right: size.width * 0.05,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          SizedBox(
            width: double.infinity,
            height: size.height * 0.06,
            child: ElevatedButton(
              onPressed: () {
                if (currentPage < 2) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF77F00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                currentPage == 2 ? 'Get Started' : 'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
