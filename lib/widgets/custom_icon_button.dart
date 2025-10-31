import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 64,
        height: 64,
        color: Colors.white10,
        child: Image.asset(
          imagePath,
          width: 64,
          height: 64,
          fit: BoxFit.cover, // Cover use karein taki poori image dikhe
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.2),
                color: Colors.grey.withOpacity(0.3),
                border: Border.all(color: Colors.grey),
              ),
              child: const Center(
                child: Icon(Icons.error_outline, size: 24, color: Colors.grey),
              ),
            );
          },
        ),
      ),
    );
  }
}
