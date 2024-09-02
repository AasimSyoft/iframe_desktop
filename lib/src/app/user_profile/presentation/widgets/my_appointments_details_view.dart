import 'package:flutter/material.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/appointments.dart';
import 'package:iframe_desktop/src/app/user_profile/presentation/widgets/my_appointment_detail_card.dart';
import 'package:iframe_desktop/src/app/user_profile/presentation/widgets/my_files_widget.dart';

class MyAppointmentDetailView extends StatelessWidget {
  const MyAppointmentDetailView({
    super.key,
    required this.appointment,
  });
  final Appointment appointment;

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
          title: Text(
            appointment.consultationId?.name ?? 'Appointment Details',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Details"),
              // Tab(text: "Notes"),
              Tab(text: "Files"),
              Tab(text: "Questionnaire"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AppointmentDetailsCard(
              appointment: appointment,
            ),
            const MyFilesWidget(),
            const Text('hehe'),
            // MyAppointmentDetails(appointment: appointment),
            // // NoteView(appointment.id.toString()),
            // FilesField(id: appointment.id.toString(), type: 'consultation'),
            // MyQuestionnaireDetailView(appointment: appointment),

            // FilesField(id: appointment.id.toString(), type: 'consultation'),
          ],
        ),
      ),
    );
  }
}
