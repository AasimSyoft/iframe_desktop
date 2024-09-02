import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/appointments.dart';
import 'package:iframe_desktop/src/features/product/widgets/product_card_widget.dart';

class AppointmentDetailsCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentDetailsCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  appointment.consultationId?.images != null &&
                          appointment.consultationId!.images!.isNotEmpty
                      ? Image.network(
                          appointment.consultationId!.images![0],
                          height: 100,
                          fit: BoxFit.contain,
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          child: Text(
                            appointment.consultationId?.name != null &&
                                    appointment.consultationId!.name!.length >=
                                        2
                                ? appointment.consultationId!.name!
                                    .substring(0, 2)
                                    .toUpperCase()
                                : 'NA',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                  const SizedBox(height: 16),
                  Text(
                    '${appointment.consultationId?.name ?? 'Free Consultation'} ',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              'Description',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            HtmlText(
              text: appointment.consultationId?.description ??
                  'No Description Available.',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),

            // Duration, Time Zone, Date, and Type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDetailItem(
                  title: 'Duration',
                  value: appointment.consultationId!.duration ?? '',
                  highlight: true,
                ),
                buildDetailItem(
                  title: 'Staff',
                  value: appointment.consultationId!.name ?? 'N/A',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDetailItem(
                  title: 'Time Zone',
                  value: appointment.timeZone ??
                      '', // Adjust according to your data
                ),
                buildDetailItem(
                  title: 'Type',
                  value: appointment.meetingType ?? 'Online',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDetailItem(
                  title: 'Date',
                  value: appointment.date ?? 'N/A',
                ),
                buildDetailItem(
                  title: 'Time',
                  value: appointment.slot ?? 'N/A',
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Bill Summary
            const Divider(),
            const Text(
              'BILL SUMMARY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            buildBillRow('Subtotal', '\$0'),
            buildBillRow('Discount', '- \$0'),
            buildBillRow('Staff Special Price', '\$0'),
            buildBillRow('Tax', '\$0'),
            const Divider(),
            buildBillRow('Grand Total', '\$0'),
          ],
        ),
      ),
    );
  }

  Widget buildDetailItem({
    required String title,
    required String value,
    bool highlight = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: highlight ? 16 : 14,
            fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
            color: highlight ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildBillRow(String label, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
