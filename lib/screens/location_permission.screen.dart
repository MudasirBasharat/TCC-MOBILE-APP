import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_clothing/screens/manual_location_screen.dart';
import '../widgets/custom_button.dart';
import '../constants/colors.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80), // Increased top spacing
              // Location Icon - Larger and centered
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  size: 50,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 40),

              // Title
              Text(
                'Enable Location Services',
                style: GoogleFonts.robotoSerif(
                  fontSize: 24,
                  fontWeight: FontWeight.w600, // Made slightly bolder
                  height: 1.3,
                  letterSpacing: -0.03,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Description - Multi-line text as per screenshot
              const Text(
                'Allow us to show you curated rentals\navailable in your area.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 40,
              ), // Allow Location Button - Full width gradient button
              CustomButton(
                text: 'Allow location',
                onPressed: () {
                  _requestLocationPermission(context);
                },
                isEnabled: true,
              ),

              const SizedBox(height: 12),

              // Enter Manually Button - Transparent background with border
              SizedBox(
                width: double.infinity,
                height: 56, // Same height as CustomButton
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManualLocationScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Enter manually',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
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

  void _requestLocationPermission(BuildContext context) {
    // Implement location permission logic here
    print('Location permission requested');

    // After permission, navigate to next screen
    // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
  }
}
