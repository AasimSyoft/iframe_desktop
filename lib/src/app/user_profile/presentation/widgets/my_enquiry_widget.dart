import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iframe_desktop/src/app/routes/app_router.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/my_enquiry_provider.dart';
import 'package:intl/intl.dart';

class MyEnquiryWidget extends ConsumerWidget {
  const MyEnquiryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enquiriesAsyncValue = ref.watch(enquiriesProvider);

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
      body: enquiriesAsyncValue.when(
        data: (enquiryList) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: enquiryList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final enquiry = enquiryList[index];
              return EnquiryCard(
                requirementTitle: enquiry.requirementTitle ?? 'N/A',
                description: enquiry.enquiryId ?? 'N/A',
                referredBy:
                    DateFormat('MMMM d, yyyy').format(enquiry.createdAt!),
                onTap: () {
                  context.go(
                    Routes.myEnquiryDetails,
                    extra: enquiry,
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
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
    required this.onTap,
  });

  final String requirementTitle;
  final String description;
  final String referredBy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
              fontSize: 10),
        ),
        trailing: Text(referredBy),
        onTap: onTap, // Navigate on tap
      ),
    );
  }
}
