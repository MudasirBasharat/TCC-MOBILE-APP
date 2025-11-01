import 'package:flutter/material.dart';
import 'package:travel_clothing/screens/profile_setup_screen.dart';
import 'package:travel_clothing/widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../constants/colors.dart';

class ManualLocationScreen extends StatefulWidget {
  const ManualLocationScreen({super.key});

  @override
  State<ManualLocationScreen> createState() => _ManualLocationScreenState();
}

class _ManualLocationScreenState extends State<ManualLocationScreen> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _countryController.text = 'United states';
    _cityController.text = 'Newyork';
    _postalCodeController.text = '11000';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Back Button
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 20,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Location Icon
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
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 16),

                      // Description
                      Text(
                        'Allow us to show you curated rentals available in your area.',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 32),

                      // Country Field
                      CustomTextField(
                        label: 'Country',
                        hintText: 'Enter country',
                        controller: _countryController,
                      ),

                      const SizedBox(height: 16),

                      // City Field
                      CustomTextField(
                        label: 'City',
                        hintText: 'Enter city',
                        controller: _cityController,
                      ),

                      const SizedBox(height: 16),

                      // Postal Code Field
                      CustomTextField(
                        label: 'Postal code',
                        hintText: 'Enter postal code',
                        keyboardType: TextInputType.number,
                        controller: _postalCodeController,
                      ),

                      // Flexible space that expands when keyboard is closed
                      const SizedBox(height: 25),
                      // Continue Button - Will move up with keyboard
                      CustomButton(
                        text: 'Continue',
                        onPressed: _handleManualLocationContinue,
                        isEnabled: true,
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleManualLocationContinue() {
    final country = _countryController.text;
    final city = _cityController.text;
    final postalCode = _postalCodeController.text;
    print('Manual location: $country, $city, $postalCode');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileSetupScreen()),
    );
  }

  @override
  void dispose() {
    _countryController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }
}
