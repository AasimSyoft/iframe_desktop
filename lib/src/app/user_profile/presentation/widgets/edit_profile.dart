import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iframe_desktop/src/app/user_profile/presentation/widgets/texfield_widget.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/edit_profile_provider.dart';
import 'package:iframe_desktop/src/features/login/providers/otp_provider.dart';

class EditProfileView extends ConsumerWidget {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  EditProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieve userId from verifyOtpProvider
    final userId = ref.watch(verifyOtpProvider.select((state) => state.userId));

    // Listen to the userProfileNotifierProvider changes inside build method
    ref.listen<UserProfileState>(userProfileNotifierProvider, (prev, next) {
      if (!next.isLoading) {
        final message = next.message ?? 'Profile updated successfully';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 450, top: 150),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/ecom.jpeg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aasim bhat",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "aasim@syoft.com",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      textEditingController: fnameController,
                      hintText: 'Enter your First Name',
                      label: 'First Name',
                      prefixIcon: HugeIcons.strokeRoundedUser,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter First Name';
                        } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Please enter valid Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFieldWidget(
                      textEditingController: lnameController,
                      hintText: 'Enter Last Name',
                      label: 'Last Name',
                      prefixIcon: HugeIcons.strokeRoundedUser,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Last Name';
                        } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Please enter valid Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      textEditingController: phoneController,
                      hintText: 'Enter Phone Number',
                      label: 'Phone Number',
                      prefixIcon: HugeIcons.strokeRoundedSendToMobile,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Phone Number';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Please enter valid Phone Number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFieldWidget(
                      textEditingController: emailController,
                      hintText: 'Enter Your Email',
                      label: 'Email',
                      prefixIcon: HugeIcons.strokeRoundedMail01,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Email';
                        } else if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'Please enter valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    _updateProfile(context, ref, userId ?? '');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateProfile(BuildContext context, WidgetRef ref, String userId) {
    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('User ID is missing. Unable to update profile.')),
      );
      return;
    }

    final String firstName = fnameController.text;
    final String lastName = lnameController.text;
    final String phone = phoneController.text;

    ref.read(userProfileNotifierProvider.notifier).postUserProfileInfo(
          ccode: "+91",
          fname: firstName,
          lname: lastName,
          phoneNumber: phone,
          isNewUser: false,
          id: userId, // Ensure that userId is passed here
        );
  }
}
