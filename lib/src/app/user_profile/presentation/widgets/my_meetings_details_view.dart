import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/meetings.dart';
import 'package:intl/intl.dart';

class MyMeetingDetailsView extends StatelessWidget {
  final Meeting meeting;

  const MyMeetingDetailsView({super.key, required this.meeting});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: const Text(
          'My Meeting Details',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display Booking ID
                      _buildTile(
                        'BOOKING ID',
                        meeting.bookingId ?? 'N/A',
                      ),
                      _buildTile(
                        'BOOKED AT',
                        meeting.bookingStartTime != null
                            ? DateFormat('EEE, dd MMM yyyy')
                                .format(meeting.bookingStartTime!)
                            : 'N/A',
                      ),
                      // Display Booking Name
                      _buildTile(
                        'BOOKING NAME',
                        meeting.bookingName ?? 'N/A',
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          SizedBox(width: 12),
                          Text('Meeting Slot'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Meeting Slot Information
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xffEFF8F7),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Duration with null safety
                              Text(
                                '• ${meeting.date != null ? DateFormat('yMMMd').format(meeting.date!) : 'N/A'}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '• ${meeting.duration ?? 'N/A'} min',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '• ${meeting.startTime ?? 'N/A'} ',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Meeting with Staff Member
                      Visibility(
                        visible: meeting.staffName != null,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.grey.shade600,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Meeting With',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: const Color(0xff7E7E7E),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.grey.shade300,
                                    child: Text(
                                      meeting.staffName != null
                                          ? meeting.staffName!
                                              .substring(0, 1)
                                              .toUpperCase()
                                          : '',
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    meeting.staffName ?? 'N/A',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      dotted(),
                      const SizedBox(height: 14),
                      // Meeting Link Availability
                      DottedBorder(
                        color: Colors.orange.shade200,
                        strokeWidth: 1,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(8),
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Meeting Link will be available 10 minutes before the scheduled time!',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Utility method to create a dotted border separator
  Widget dotted() {
    return const DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 2.0,
      dashColor: Color(0xffD6D6D6),
      dashGapLength: 4.0,
    );
  }

  // Method for building a tile with title and value
  Widget _buildTile(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(
                width: 164,
                child: Text(
                  '$title :',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        dotted(),
      ],
    );
  }
}
