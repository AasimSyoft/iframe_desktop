import 'package:flutter/material.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/enquiry.dart';
import 'package:iframe_desktop/src/app/user_profile/presentation/widgets/my_enquiry_product_widget.dart';

class MyEnquiryDetailView extends StatelessWidget {
  const MyEnquiryDetailView({
    super.key,
    required this.enquiry,
  });
  final Enquiry enquiry;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Text(
            'Enquiry Details',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Product"),
              // Tab(text: "Notes"),
              Tab(text: "Task"),
              Tab(text: "Notes"),
              // Tab(text: "Conversation"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyEnquiryProductWidget(
              enquiry: enquiry,
            ),
            const Text('hohojooj'),
            const Text('hihihi')
          ],
        ),
      ),
    );
  }
}
