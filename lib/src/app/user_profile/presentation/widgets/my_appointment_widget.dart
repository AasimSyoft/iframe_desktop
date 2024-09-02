import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iframe_desktop/src/app/routes/app_router.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/appointments.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/my_appoitments_provider.dart';
import 'package:iframe_desktop/src/features/product/widgets/product_card_widget.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

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
                        final appointments = myAppointment.data ?? [];
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
                    const Center(child: Text('')),
                    const Center(child: Text('')),
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
    return ResponsiveGridList(
      minItemsPerRow: 2,
      maxItemsPerRow: 2,
      horizontalGridSpacing: 10,
      verticalGridSpacing: 10,
      minItemWidth: 5 / 1.9,
      children: appointments.map((appointment) {
        return AppointmentCard(appointment: appointment);
      }).toList(),
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
    final consultation = appointment.consultationId;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.go(Routes.appointmentsDetails, extra: appointment);
        },
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
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: consultation?.images?.isNotEmpty ?? false
                          ? Image.network(
                              consultation!.images!.first,
                              height: 76,
                              width: 59,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.photo,
                              color: Colors.black,
                              size: 25,
                            ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          consultation!.name ??
                              'Unknown Consultation', // Name from consultationId
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        HtmlText(
                          text: consultation.description ?? 'No Description',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              'Starts from ',
                              style: GoogleFonts.inter(
                                  fontSize: 11, color: Colors.grey),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              appointment.amount?.toString() ??
                                  '', // Amount from appointment
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Meeting Type:',
                              style: GoogleFonts.inter(
                                  fontSize: 11, color: Colors.black),
                            ),
                            Text(
                              appointment.meetingType ??
                                  '', // Slot from appointment
                              style: GoogleFonts.inter(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${consultation.duration} min duration',
                          // Status from appointment
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Booking Date:',
                        style: GoogleFonts.inter(
                            fontSize: 11, color: Colors.black),
                      ),
                      Text(
                        appointment.date ?? '',
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Slot:',
                        style: GoogleFonts.inter(
                            fontSize: 11, color: Colors.black),
                      ),
                      Text(
                        appointment.slot ?? '',
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                appointment.appointmentStatus ?? '',
                style: GoogleFonts.inter(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
