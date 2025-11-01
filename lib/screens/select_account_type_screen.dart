import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_clothing/constants/colors.dart';
import 'package:travel_clothing/screens/sign_up_screen.dart';
import 'package:travel_clothing/widgets/custom_button.dart';
import 'login_screen.dart'; // LoginScreen import karo

class AccountTypeScreen extends StatefulWidget {
  const AccountTypeScreen({super.key});

  @override
  State<AccountTypeScreen> createState() => _AccountTypeScreenState();
}

class _AccountTypeScreenState extends State<AccountTypeScreen> {
  String? _selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 112),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Logo/Title
              Center(
                child: Image.asset(
                  'assets/app_logo.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 40),

              // Title
              Text(
                'Select account type',
                style: GoogleFonts.robotoSerif(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  letterSpacing: -0.03,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Text(
                'Select your account type to create an account',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Account Type Cards - EXACT SAME AS SCREENSHOT
              Row(
                children: [
                  Expanded(
                    child: _buildAccountTypeCard(
                      title: 'Traveler',
                      icon: Icons.public,
                      isSelected: _selectedAccountType == 'Traveler',
                      onTap: () {
                        setState(() {
                          _selectedAccountType = 'Traveler';
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: _buildAccountTypeCard(
                      title: 'Rider',
                      icon: Icons.pedal_bike_outlined,
                      isSelected: _selectedAccountType == 'Rider',
                      onTap: () {
                        setState(() {
                          _selectedAccountType = 'Rider';
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              // Sign Up Button
              CustomButton(
                text: 'Sign up',
                onPressed: _selectedAccountType == null
                    ? null
                    : () {
                        _handleSignUp();
                      },
                isEnabled: _selectedAccountType != null,
              ),

              const SizedBox(height: 25),

              // Sign In Text
              Center(
                child: GestureDetector(
                  onTap: () {
                    _handleSignIn(); // Changed to navigate to LoginScreen
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTypeCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.05)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textFieldBorder,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              )
            else
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),

            // Agar aapko custom tick chahiye toh yeh add karein
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.check_circle,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _handleSignUp() {
    print('Selected account type: $_selectedAccountType');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(accountType: ''),
      ),
    );
  }

  void _handleSignIn() {
    // LoginScreen par navigate karo
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
