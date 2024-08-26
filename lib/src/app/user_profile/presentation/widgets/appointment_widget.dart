import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/appointments.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/my_appoitments_provider.dart';

class AppointmentWidget extends ConsumerStatefulWidget {
  const AppointmentWidget({super.key});

  @override
  ConsumerState<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends ConsumerState<AppointmentWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch appointments when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(appointmentsProvider.notifier).fetchAppointments(1, 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsState = ref.watch(appointmentsProvider);

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
              Expanded(
                child: TabBarView(
                  children: [
                    appointmentsState.when(
                      data: (myAppointment) {
                        final appointments = myAppointment.appointment ?? [];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child:
                              AppointmentCardGrid(appointments: appointments),
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) =>
                          Center(child: Text('Error: $error')),
                    ),
                    const Center(child: Text('Past appointments')),
                    const Center(child: Text('Cancelled appointments')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCardGrid extends StatelessWidget {
  final List<Appointment> appointments;

  const AppointmentCardGrid({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: appointments.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 6 / 2,
      ),
      itemBuilder: (context, index) {
        return AppointmentCard(appointment: appointments[index]);
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final bool isShowButton;

  const AppointmentCard({
    super.key,
    required this.appointment,
    this.isShowButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 8)],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 0.5,
            ),
          ),
          padding: const EdgeInsets.all(8), // Reduced padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: appointment.info?.staff?.staffId != null
                          ? Image.network(
                              "https://example.com/${appointment.info?.staff?.staffId}.jpeg", // Placeholder for staff image URL
                              height: 76,
                              width: 49,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "assets/images/ecom.jpeg", // Fallback image
                              height: 76,
                              width: 49,
                            ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 18,
                          width: 70,
                          color: Colors.brown,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          appointment.info?.staff?.staffName ??
                              'Consultation Name',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          appointment.info?.address ??
                              'Consultation description goes here',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              'Starts from',
                              style: GoogleFonts.inter(
                                  fontSize: 11, color: Colors.grey),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              appointment.amount?.toString() ?? '0',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: DottedBorder(
                  color: Colors.grey.shade400,
                  dashPattern: const [4, 4],
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffEFF8F7),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          appointment.slot ?? '',
                          style: GoogleFonts.inter(
                              fontSize: 11, color: Colors.black),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          appointment.appointmentStatus ?? '',
                          style: GoogleFonts.inter(
                              fontSize: 11, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (isShowButton) ...[
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 36.0),
                        ),
                        onPressed: () {
                          // Placeholder button action
                        },
                        child: const Text('Book Now'),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: const Size(double.infinity, 36.0),
                          padding: EdgeInsets.zero,
                          side: BorderSide(
                              color: Colors.grey.shade600, width: 0.5),
                          foregroundColor: Colors.grey.shade600,
                        ),
                        onPressed: () {},
                        child: const Text('View Details'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
