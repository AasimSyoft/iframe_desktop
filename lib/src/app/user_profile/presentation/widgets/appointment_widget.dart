import 'package:flutter/material.dart';
import 'package:iframe_desktop/src/app/user_profile/presentation/widgets/appointment_card_widget.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const TabBar(
                indicatorColor: Colors.brown,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Past'),
                  Tab(text: 'Cancelled'),
                ],
              ),
              // TabBarView as the body content
              Expanded(
                child: TabBarView(
                  children: [
                    _buildAppointment(),
                    _buildAppointment(),
                    _buildAppointment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointment() {
    final List<AppointmentCard> appointments = List.generate(
      10,
      (index) => const AppointmentCard(),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppointmentCardGrid(appointments: appointments),
    );
  }
}
