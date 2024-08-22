import 'package:flutter/material.dart';

class MyServicesWidget extends StatelessWidget {
  const MyServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Image.asset(
              'assets/images/ecom.jpeg',
              height: 150,
            ),
          ),
          const Text(
            "You don't have any services available yet",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      )),
    );
  }
}
