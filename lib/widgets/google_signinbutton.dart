import 'package:flutter/material.dart';
import 'package:travel_clothing/constants/colors.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLogin; // New parameter to identify login/signup

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.isLogin = false, // Default to sign up
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Google_Logo.png', width: 24, height: 24),
            const SizedBox(width: 12),
            Text(
              isLogin ? 'Sign in with Google' : 'Sign up with Google',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
