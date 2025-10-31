import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_clothing/widgets/custom_icon_button.dart';
import 'package:travel_clothing/widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../constants/colors.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  // Focus nodes for dropdown fields
  final FocusNode _genderFocusNode = FocusNode();
  final FocusNode _sizeFocusNode = FocusNode();

  // Avatar related variables
  int _selectedAvatar = 0;
  final List<String> _avatars = [
    'assets/avatar1.jpg',
    'assets/avatar2.jpg',
    'assets/avatar6.jpg',
    'assets/avatar7.jpg',
    'assets/avatar8.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Pre-fill with example data
    _nameController.text = 'Shawn Obrain';
    _genderController.text = 'Male';
    _sizeController.text = 'Medium';
    _dobController.text = '20-03-2000';

    // Add focus listeners
    _genderFocusNode.addListener(() {
      if (_genderFocusNode.hasFocus) {
        _genderFocusNode.unfocus();
        _showGenderDropdown();
      }
    });

    _sizeFocusNode.addListener(() {
      if (_sizeFocusNode.hasFocus) {
        _sizeFocusNode.unfocus();
        _showSizeDropdown();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconButton(
                onPressed: () {
                  print('Icon button pressed');
                },
                imagePath:
                    'assets/icon_pic.png', // Poori 64x64 image with background
              ),
              SizedBox(height: 32),
              // Title
              Text(
                'Profile Setup',
                style: GoogleFonts.robotoSerif(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  letterSpacing: -0.03,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              const Text(
                'Please enter your details to continue',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),

              const SizedBox(height: 40),

              // Avatar Selection - Center mein
              Stack(
                children: [
                  // Avatar Container
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.asset(
                        _avatars[_selectedAvatar],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.primary.withOpacity(0.1),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: AppColors.primary,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Edit Icon - Avatar ke andar bottom right mein
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _showAvatarSelection,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.background,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Name Field
              CustomTextField(
                label: 'Name',
                hintText: 'Enter your name',
                controller: _nameController,
              ),

              const SizedBox(height: 20),

              // Gender Field - Dropdown on tap (WORKING SOLUTION)
              CustomTextField(
                label: 'Gender',
                hintText: 'Select gender',
                controller: _genderController,
                readOnly: true,
                focusNode: _genderFocusNode,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                onTap: _showGenderDropdown, // Direct onTap in CustomTextField
              ),

              const SizedBox(height: 20),

              // Size Field - Dropdown on tap (WORKING SOLUTION)
              CustomTextField(
                label: 'Size',
                hintText: 'Select size',
                controller: _sizeController,
                readOnly: true,
                focusNode: _sizeFocusNode,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                onTap: _showSizeDropdown, // Direct onTap in CustomTextField
              ),

              const SizedBox(height: 20),

              // Date of Birth Field
              CustomTextField(
                label: 'Date of birth',
                hintText: 'DD-MM-YYYY',
                controller: _dobController,
                readOnly: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.grey),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),

              const SizedBox(height: 40),

              // Continue Button
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  _handleContinue();
                },
                isEnabled: true,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showGenderDropdown() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Gender',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...['Male', 'Female', 'Other'].map((gender) {
              return ListTile(
                title: Text(gender),
                onTap: () {
                  setState(() {
                    _genderController.text = gender;
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showSizeDropdown() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...['Small', 'Medium', 'Large', 'Extra Large'].map((size) {
              return ListTile(
                title: Text(size),
                onTap: () {
                  setState(() {
                    _sizeController.text = size;
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showAvatarSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Choose Avatar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Avatar Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: _avatars.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAvatar = index;
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedAvatar == index
                            ? AppColors.primary
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        _avatars[index],
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.withOpacity(0.2),
                            child: const Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dobController.text =
            "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      });
    }
  }

  void _handleContinue() {
    final name = _nameController.text;
    final gender = _genderController.text;
    final size = _sizeController.text;
    final dob = _dobController.text;
    final avatar = _avatars[_selectedAvatar];

    print('Profile Data: $name, $gender, $size, $dob, Avatar: $avatar');

    // Navigate to next screen
    // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _sizeController.dispose();
    _dobController.dispose();
    _genderFocusNode.dispose();
    _sizeFocusNode.dispose();
    super.dispose();
  }
}
