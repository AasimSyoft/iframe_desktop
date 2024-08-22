// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Import this for input formatters
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:iframe_desktop/src/features/login/providers/login_provider.dart';
// import 'package:iframe_desktop/src/features/login/providers/otp_provider.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class VerifyOtpView extends ConsumerStatefulWidget {
//   final String userId; // Pass the userId from login

//   const VerifyOtpView({super.key, required this.userId});

//   @override
//   ConsumerState<VerifyOtpView> createState() => _VerifyOtpViewState();
// }

// class _VerifyOtpViewState extends ConsumerState<VerifyOtpView> {
//   final TextEditingController otpController = TextEditingController();
//   String otp = '';

//   @override
//   void dispose() {
//     otpController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     final userId = ref.read(loginProvider.select((state) => state.userId));
//     print('UserId is: $userId'); // Check if this prints a valid userId
//     super.initState();
  
//   }

//   @override
//   Widget build(BuildContext context) {
//     final verifyOtpState =
//         ref.watch(verifyOtpProvider); // Watching OTP provider state
//     final verifyOtpNotifier =
//         ref.read(verifyOtpProvider.notifier); // Accessing notifier

//     const String email = ''; // Replace with your email retrieval logic
//     final String maskedEmail = email.isNotEmpty && email.contains('@')
//         ? '${email.substring(0, 3)}****${email.substring(email.indexOf('@'))}'
//         : '****@****'; // Default placeholder if email is empty or invalid

//     final theme = Theme.of(context);

//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 120, left: 120),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Spacer(),
//               Hero(
//                 tag: 'logo',
//                 child: Image.asset(
//                   "assets/images/ecom.jpeg",
//                   height: 50,
//                   width: 60,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 'Please enter OTP',
//                 style: GoogleFonts.inter(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Enter the 6 digit verification code sent to $maskedEmail',
//                 style: GoogleFonts.inter(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: PinCodeTextField(
//                   controller: otpController,
//                   appContext: context,
//                   length: 6,
//                   keyboardType: TextInputType.number,
//                   autoFocus: true,
//                   onChanged: (value) {
//                     setState(() {
//                       otp = value;
//                     });
//                   },
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                   ],
//                   pinTheme: PinTheme(
//                     shape: PinCodeFieldShape.box,
//                     fieldHeight: 50,
//                     fieldWidth: 50,
//                     activeColor: theme.colorScheme.primary,
//                     activeFillColor: Colors.white,
//                     selectedColor: theme.colorScheme.primary,
//                     inactiveColor: Colors.grey.shade300,
//                     inactiveBorderWidth: 0.5,
//                     inactiveFillColor: Colors.white,
//                     selectedFillColor: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   enableActiveFill: true,
//                   cursorColor: theme.colorScheme.primary,
//                   animationType: AnimationType.fade,
//                 ),
//               ),
//               const Spacer(),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size.fromHeight(45),
//                   backgroundColor: Colors.brown,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: otp.length < 6 || verifyOtpState.isLoading
//                     ? null
//                     : () {
//                         // Trigger OTP verification
//                         verifyOtpNotifier.verifyOtp(
//                             otp, widget.userId, context);
//                       },
//                 child: verifyOtpState.isLoading
//                     ? const SizedBox(
//                         height: 20,
//                         width: 20,
//                         child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation(Colors.white),
//                         ),
//                       )
//                     : const Text(
//                         'Verify',
//                         style: TextStyle(color: Colors.white),
//                       ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Didn\'t receive the code?',
//                     style: GoogleFonts.inter(
//                       fontSize: 14,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Add resend OTP logic here
//                     },
//                     child: const Text('Resend'),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: 60,
//           left: 20,
//           child: IconButton.filled(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(HugeIcons.strokeRoundedCancel01, size: 20),
//             style: ElevatedButton.styleFrom(
//               shape: const CircleBorder(),
//               padding: const EdgeInsets.all(0),
//               backgroundColor: Colors.white,
//               minimumSize: const Size(40, 40),
//               foregroundColor: Colors.black,
//               side: BorderSide(color: Colors.grey.shade300, width: 0.5),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iframe_desktop/src/features/login/providers/otp_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:iframe_desktop/src/features/login/providers/login_provider.dart'; // Import your login provider

class VerifyOtpView extends ConsumerStatefulWidget {
  const VerifyOtpView({super.key});

  @override
  ConsumerState<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends ConsumerState<VerifyOtpView> {
  final TextEditingController otpController = TextEditingController();
  String otp = '';

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final userId = ref.read(loginProvider.select((state) => state.userId));
    print('UserId is: $userId'); // Check if this prints a valid userId
  }

  @override
  Widget build(BuildContext context) {
    final verifyOtpState = ref.watch(verifyOtpProvider); // Watching OTP provider state
    final verifyOtpNotifier = ref.read(verifyOtpProvider.notifier); // Accessing notifier

    // Retrieve userId from loginProvider
    final userId = ref.watch(loginProvider.select((state) => state.userId));

    // You can handle the case where userId might be null here, if needed.

    const String email = ''; // Replace with your email retrieval logic
    final String maskedEmail = email.isNotEmpty && email.contains('@')
        ? '${email.substring(0, 3)}****${email.substring(email.indexOf('@'))}'
        : '****@****'; // Default placeholder if email is empty or invalid

    final theme = Theme.of(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 120, left: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Hero(
                tag: 'logo',
                child: Image.asset(
                  "assets/images/ecom.jpeg",
                  height: 50,
                  width: 60,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Please enter OTP',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Enter the 6 digit verification code sent to $maskedEmail',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  length: 6,
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeColor: theme.colorScheme.primary,
                    activeFillColor: Colors.white,
                    selectedColor: theme.colorScheme.primary,
                    inactiveColor: Colors.grey.shade300,
                    inactiveBorderWidth: 0.5,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enableActiveFill: true,
                  cursorColor: theme.colorScheme.primary,
                  animationType: AnimationType.fade,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: otp.length < 6 || verifyOtpState.isLoading
                    ? null
                    : () {
                        // Trigger OTP verification
                        verifyOtpNotifier.verifyOtp(
                            otp, userId ?? '', context); // Pass userId here
                      },
                child: verifyOtpState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : const Text(
                        'Verify',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive the code?',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add resend OTP logic here
                    },
                    child: const Text('Resend'),
                  )
                ],
              ),
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
    );
  }
}
