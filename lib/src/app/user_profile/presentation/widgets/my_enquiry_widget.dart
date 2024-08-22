import 'package:flutter/material.dart';

class MyEnquiryWidget extends StatelessWidget {
  const MyEnquiryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> enquiryList = [
      {
        'requirementTitle': 'Web Development',
        'description': 'Looking for a web development project.',
        'referredBy': 'John Doe',
      },
      {
        'requirementTitle': 'Mobile App Development',
        'description': 'Need a mobile app for our business.',
        'referredBy': 'Jane Smith',
      },
      {
        'requirementTitle': 'SEO Optimization',
        'description': 'Looking to optimize our website for search engines.',
        'referredBy': 'Alice Johnson',
      },
      {
        'requirementTitle': 'SEO Optimization',
        'description': 'Looking to optimize our website for search engines.',
        'referredBy': 'Alice Johnson',
      },
      {
        'requirementTitle': 'Mobile App Development',
        'description': 'Need a mobile app for our business.',
        'referredBy': 'Jane Smith',
      },
      {
        'requirementTitle': 'SEO Optimization',
        'description': 'Looking to optimize our website for search engines.',
        'referredBy': 'Alice Johnson',
      },
      {
        'requirementTitle': 'SEO Optimization',
        'description': 'Looking to optimize our website for search engines.',
        'referredBy': 'Alice Johnson',
      },
      {
        'requirementTitle': 'Web Development',
        'description': 'Looking for a web development project.',
        'referredBy': 'John Doe',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Enquiries',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: enquiryList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final enquiry = enquiryList[index];
          return EnquiryCard(
            requirementTitle: enquiry['requirementTitle'] ?? 'N/A',
            description: enquiry['description'] ?? 'N/A',
            referredBy: enquiry['referredBy'] ?? 'N/A',
          );
        },
      ),
    );
  }
}

class EnquiryCard extends StatelessWidget {
  const EnquiryCard({
    super.key,
    required this.requirementTitle,
    required this.description,
    required this.referredBy,
  });

  final String requirementTitle;
  final String description;
  final String referredBy;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final colorScheme = theme.colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: ListTile(
        title: Text(
          requirementTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        subtitle: Text(description),
        trailing: Text(referredBy),
        onTap: () {
          // Handle onTap event, e.g., navigate to details page
        },
      ),
    );
  }
}
