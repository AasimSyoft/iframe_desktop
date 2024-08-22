import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MeetingsWidget extends StatefulWidget {
  const MeetingsWidget({
    super.key,
  });

  @override
  State<MeetingsWidget> createState() => _MeetingsWidgetState();
}

class _MeetingsWidgetState extends State<MeetingsWidget> with AutomaticKeepAliveClientMixin {
  @override
  void didUpdateWidget(covariant MeetingsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
                child: Text(
              "Meet Our Team",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            if (true) // Replace with your condition
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: const Text('View all'),
              ),
          ],
        ),
        const SizedBox(height: 12.0),
        StaffProfileBuilder(
          staffProfiles: [
            StaffProfile(
              image: 'https://example.com/image1.jpg',
              name: 'John Doe',
              descriptionTitle: 'Senior Developer',
              profileInfo: ProfileInfo(qualification: 'MSc Computer Science', badge: Badge(name: 'Expert')),
              meetingDescription: 'John specializes in mobile app development and has over 10 years of experience.',
              staff: '1',
            ),
            StaffProfile(
              image: 'https://example.com/image2.jpg',
              name: 'Jane Smith',
              descriptionTitle: 'Project Manager',
              profileInfo: ProfileInfo(qualification: 'MBA', badge: Badge(name: 'Manager')),
              meetingDescription: 'Jane is an experienced project manager with a knack for delivering projects on time.',
              staff: '2',
            ),
            // Add more staff profiles as needed
          ],
        ),
      ],
    );
  }
}

class StaffProfileBuilder extends StatelessWidget {
  final List<StaffProfile> staffProfiles;
  const StaffProfileBuilder({super.key, required this.staffProfiles});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        // boxShadow: AppConstants.kDefaultShadow,
      ),
      child: CarouselSlider(
        items: staffProfiles.map((staffProfile) => MeetingStaffCard(staffProfile: staffProfile)).toList(),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 7),
          viewportFraction: 1,
          height: 230,
        ),
      ),
    );
  }
}

class MeetingStaffCard extends StatelessWidget {
  final StaffProfile staffProfile;
  final bool isShowDecoration;
  const MeetingStaffCard({super.key, required this.staffProfile, this.isShowDecoration = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: isShowDecoration
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // boxShadow: AppConstants.kDefaultShadow,
            )
          : null,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/ecom.jpeg",
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          staffProfile.name ?? 'John Doe',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Spacer(),
                        _buildBadge(),
                      ],
                    ),
                    Text(
                      staffProfile.descriptionTitle ?? 'Position Title',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      staffProfile.profileInfo?.qualification ?? 'Qualification',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            staffProfile.meetingDescription ?? 'Meeting Description',
            style: theme.textTheme.bodySmall!.copyWith(color: Colors.grey.shade500),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 26),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // const SizedBox(width: 10),
          // Container(
          //   decoration: BoxDecoration(
          //     color: theme.colorScheme.primary,
          //     shape: BoxShape.circle,
          //   ),
          //   height: 25,
          //   width: 25,
          //   padding: const EdgeInsets.all(5.0),
          //   child: Icon(
          //     Icons.arrow_outward_rounded,
          //     size: 12.0,
          //     color: theme.colorScheme.onPrimary,
          //   ),
          // ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  _buildBadge() {
    if (staffProfile.profileInfo?.badge == null) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        staffProfile.profileInfo?.badge?.name ?? 'Badge Name',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

// Dummy models
class StaffProfile {
  final String? image;
  final String? name;
  final String? descriptionTitle;
  final ProfileInfo? profileInfo;
  final String? meetingDescription;
  final String? staff;

  StaffProfile({
    this.image,
    this.name,
    this.descriptionTitle,
    this.profileInfo,
    this.meetingDescription,
    this.staff,
  });
}

class ProfileInfo {
  final String? qualification;
  final Badge? badge;

  ProfileInfo({this.qualification, this.badge});
}

class Badge {
  final String? name;

  Badge({this.name});
}
