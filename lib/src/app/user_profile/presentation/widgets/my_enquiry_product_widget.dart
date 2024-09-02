import 'package:flutter/material.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/enquiry.dart';

class MyEnquiryProductWidget extends StatelessWidget {
  const MyEnquiryProductWidget({
    super.key,
    required this.enquiry,
  });
  final Enquiry enquiry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              'https://via.placeholder.com/200',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16.0),

          // Product Title
          Text(
            enquiry.requirementTitle ?? 'N/A',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),

          // Price and Serving Information
          const Row(
            children: [
              Text(
                '\$200',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                '\$100',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Product Description
          Text(
            enquiry.description ?? 'N/A',
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
