import 'package:flutter/material.dart';
import 'package:iframe_desktop/src/app/home/widgets/banner_widget.dart';
import 'package:iframe_desktop/src/app/home/widgets/feed_widget.dart';
import 'package:iframe_desktop/src/app/home/widgets/meetings_widget.dart';
import 'package:iframe_desktop/src/app/home/widgets/service_widget.dart';

import '../widgets/announcement_widget.dart';
import '../widgets/appoitment_catagory_widget.dart';
import '../widgets/form_widget.dart';
import '../widgets/gallery_widget.dart';
import '../widgets/heading_widget.dart';
import '../widgets/knowleadge_base_widget.dart';
import '../widgets/product_catagory_widget.dart';
import '../widgets/product_widget.dart';
import '../widgets/schedule_appointment_widget.dart';
import '../widgets/service_catagory_widget.dart';
import '../widgets/smart_form_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(),
      // drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingWidget(),
              SizedBox(height: 20),
              BannerWidget(),
              SizedBox(height: 20),
              // AppointmentWidget(),
              SizedBox(height: 20),
              AppointmentCategoryWidget(),
              SizedBox(height: 20),
              FormWidget(),
              SizedBox(height: 20),
              ProductCategoryWidget(),
              SizedBox(height: 20),
              ServiceCategoryWidget(),
              SizedBox(height: 20),
              MeetingsWidget(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SmartFormWidget(),
              ProductWidget(),
              SizedBox(height: 20),
              ServiceWidget(),
              SizedBox(height: 20),
              GalleryWidget(),
              SizedBox(height: 20),
              FeedWidget(),
              SizedBox(height: 20),
              ScheduleAppointmentWidget(),
              SizedBox(height: 20),
              AnnouncementWidget(),
              SizedBox(height: 20),
              KnowledgeListView()
            ],
          ),
        ),
      ),
    );
  }
}
