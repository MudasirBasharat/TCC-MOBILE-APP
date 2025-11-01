import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_clothing/constants/colors.dart';
import 'package:travel_clothing/screens/select_account_type_screen.dart';
import 'package:travel_clothing/widgets/custom_button.dart';
import 'package:travel_clothing/widgets/custom_textfield.dart';
import 'package:travel_clothing/widgets/google_signinbutton.dart';
// AccountTypeScreen import karo

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = 'name@mail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back Button
              const SizedBox(height: 40),

              // Logo - Add your logo image here
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
                'Log in to your account',
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
              const Text(
                'Welcome back! Please enter your details.',
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
              ),

              const SizedBox(height: 32),

              // Email Field - Using CustomTextField
              CustomTextField(
                label: 'Email',
                hintText: 'name@mail.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // Password Field - Using CustomTextField with suffixIcon
              CustomTextField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),

              const SizedBox(height: 8),

              // Remember me & Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember me
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        activeColor: AppColors.primary,
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),

                  // Forgot password
                  GestureDetector(
                    onTap: () {
                      // Handle forgot password
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Sign In Button
              CustomButton(
                text: 'Sign in',
                onPressed: () {
                  _handleSignIn();
                },
                isEnabled: true,
              ),

              const SizedBox(height: 32),

              // OR Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.textFieldBorder.withOpacity(0.5),
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.textFieldBorder.withOpacity(0.5),
                      thickness: 1,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // Google Sign In Button Only - Original Design
              Center(
                child: GoogleSignInButton(
                  onPressed: () {
                    _handleGoogleSignIn();
                  },
                  isLogin: true,
                ),
              ),

              const SizedBox(height: 32),

              // Don't have account - NOW FUNCTIONAL
              Center(
                child: GestureDetector(
                  onTap: () {
                    _handleSignUp(); // Navigate to AccountTypeScreen
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignIn() {
    final email = _emailController.text;
    final password = _passwordController.text;
    print('Sign in: $email, $password');
    // Implement sign in logic

    // Success hone par home screen par navigate karo
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    //   (route) => false,
    // );
  }

  void _handleGoogleSignIn() {
    print('Google sign in');
    // Implement Google sign in
  }

  void _handleSignUp() {
    // AccountTypeScreen par navigate karo
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AccountTypeScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
