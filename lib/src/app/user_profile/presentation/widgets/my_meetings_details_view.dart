import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyMeetingDetailsView extends StatelessWidget {
  const MyMeetingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    final myMeeting = _getSampleMeetingData();

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Services',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
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
                    _buildTile(
                      'BOOKING ID',
                      myMeeting['bookingId'] ?? '',
                    ),
                    _buildTile(
                      'BOOKED At',
                      DateFormat('EEE, dd MMM yyyy').format(
                        myMeeting['bookedAt'] ?? DateTime.now(),
                      ),
                    ),
                    _buildTile(
                      'BOOKING NAME',
                      myMeeting['bookingName'] ?? '',
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SizedBox(width: 12),
                        Text('Meeting Slot'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xffEFF8F7),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '• ${DateFormat('EEE, dd MMM ').format(myMeeting['startStr'] ?? DateTime.now())}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '• ${myMeeting['duration']} min',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '• ${DateFormat('hh:mm').format(myMeeting['startStr'] ?? DateTime.now())}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: myMeeting['staffName'] != null,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey.shade300,
                                  child: Text(
                                    myMeeting['staffName']
                                            ?.substring(0, 1)
                                            .toUpperCase() ??
                                        '',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  myMeeting['staffName'] ?? '',
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
                    myMeeting['startStr']!.isAfter(DateTime.now())
                        ? DottedBorder(
                            color: Colors.orange.shade200,
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              'Meeting Link Will be Available 10 minutes before the scheduled time!',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const Spacer(),
                    // MeetingJoinButton(
                    //   meetingLink: myMeeting['meetingLink'] ?? '',
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTile(
    String title,
    String value, {
    bool isContained = false,
  }) {
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
                ),
              ),
              Visibility(
                visible: isContained,
                replacement: Expanded(
                  child: Text(
                    value,
                    maxLines: 2,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFCEED8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'rererer',
                    style: TextStyle(
                      color: Color(
                        0xff73321A,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        dotted(),
      ],
    );
  }

  Widget dotted() {
    return const DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 2.0,
      dashColor: Color(0xffD6D6D6),
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    );
  }

  Map<String, dynamic> _getSampleMeetingData() {
    return {
      'bookingId': '12345',
      'bookedAt': DateTime.now().subtract(const Duration(days: 1)),
      'bookingName': 'Sample Booking',
      'startStr': DateTime.now().add(const Duration(hours: 1)),
      'duration': 30,
      'staffName': 'John Doe',
      'meetingLink': 'https://example.com/meeting-link',
    };
  }
}

// class MeetingJoinButton extends StatelessWidget {
//   final String meetingLink;

//   const MeetingJoinButton({
//     super.key,
//     required this.meetingLink,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         // Handle join meeting action
//       },
//       child: const Text('Join Meeting'),
//     );
//   }
// }
