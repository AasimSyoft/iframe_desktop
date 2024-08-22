import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'texfield_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 450, top: 150),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info section
              const Text(
                "Edit Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/ecom.jpeg'),
                  ),
                  SizedBox(width: 16),
                  // User Details
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

              // Form Fields
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: 'Enter your First Name',
                      label: 'First Name',
                      prefixIcon: HugeIcons.strokeRoundedUser,
                      validator: (value) {
                        RegExp regExp = RegExp(r'^[a-zA-Z ]+$');
                        if (value!.isEmpty) {
                          return 'Please enter First Name';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFieldWidget(
                      hintText: 'Enter Last Name',
                      label: 'Last Name',
                      prefixIcon: HugeIcons.strokeRoundedUser,
                      validator: (value) {
                        RegExp regExp = RegExp(r'^[a-zA-Z ]+$');
                        if (value!.isEmpty) {
                          return 'Please enter First Name';
                        } else if (!regExp.hasMatch(value)) {
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
                      hintText: 'Enter Phone Number',
                      label: 'Phone Number',
                      prefixIcon: HugeIcons.strokeRoundedSendToMobile,
                      validator: (value) {
                        RegExp regExp = RegExp(r'^[a-zA-Z ]+$');
                        if (value!.isEmpty) {
                          return 'Please enter First Name';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFieldWidget(
                      hintText: 'Enter Your Email',
                      label: 'Enter Email',
                      prefixIcon: HugeIcons.strokeRoundedMail01,
                      validator: (value) {
                        RegExp regExp = RegExp(r'^[a-zA-Z ]+$');
                        if (value!.isEmpty) {
                          return 'Please enter First Name';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid Name';
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
                  onPressed: () {},
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
}
