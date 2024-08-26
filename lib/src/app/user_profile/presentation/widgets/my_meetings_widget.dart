import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/meetings.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/my_enquiry_provider.dart';
import 'package:intl/intl.dart';

// Define a provider for fetching meetings
final meetingsProvider = FutureProvider<MeetingsModel>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchMeetings();
});

class MyMeetingView extends ConsumerWidget {
  const MyMeetingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meetingsAsyncValue = ref.watch(meetingsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Meeting',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: meetingsAsyncValue.when(
        data: (meetings) {
          // Check if data is available
          if (meetings.data == null || meetings.data!.isEmpty) {
            return const Center(child: Text('No meetings available'));
          }

          return ListView.separated(
            itemCount: meetings.data!.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey.shade300,
                height: 0,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              final meeting = meetings.data![index];
              return MyMeetingCard(
                staffName: meeting.staffName,
                bookingName: meeting.bookingName,
                date: meeting.date,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class MyMeetingCard extends StatelessWidget {
  final String? staffName;
  final String? bookingName;
  final DateTime? date;

  const MyMeetingCard({
    super.key,
    this.staffName,
    this.bookingName,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey.shade200,
          child: Text(
            staffName?.substring(0, 2).toUpperCase() ?? '',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(
          bookingName ?? '',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              staffName ?? '',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFCEED8),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Text(
                '• ${DateFormat('EEE, dd MMM ').format(date ?? DateTime.now())}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xff73321B),
                ),
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        visualDensity: VisualDensity.compact,
        onTap: () {
          // Handle navigation or action on tap
        },
      ),
    );
  }
}
