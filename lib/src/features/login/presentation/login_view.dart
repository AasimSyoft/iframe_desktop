import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iframe_desktop/src/features/login/providers/login_provider.dart';

class LoginView extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    "assets/images/ecom.jpeg",
                    height: 40,
                    width: 50,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your AI companion to interact\nwith users',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: emailController,
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email address',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(45),
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: loginState.isLoading
                      ? null
                      : () {
                          if (formKey.currentState?.validate() ?? false) {
                            // Trigger the login action in the provider
                            ref.read(loginProvider.notifier).login(
                                  emailController.text,
                                  context,
                                );
                          }
                        },
                  child: loginState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: IconButton.filled(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(HugeIcons.strokeRoundedCancel01, size: 20),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.white,
                minimumSize: const Size(40, 40),
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.grey.shade300, width: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
