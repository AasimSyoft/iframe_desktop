// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../user_profile/presentation/widgets/appointment_card_widget.dart';

// class AppointmentWidget extends StatefulWidget {
//   const AppointmentWidget({super.key});

//   @override
//   State<AppointmentWidget> createState() => _AppointmentWidgetState();
// }

// class _AppointmentWidgetState extends State<AppointmentWidget> with AutomaticKeepAliveClientMixin {
//   final List<Consultation> _consultations = List.generate(
//     5,
//     (index) => Consultation(
//       id: 'consultation_$index',
//       title: 'Consultation $index',
//       description: 'Description for consultation $index',
//       image: 'assets/images/ecom.jpeg',
//     ),
//   );

//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Featured Consultations',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ), // Hard-coded heading
//         const SizedBox(height: 12.0),
//         AppointmentListBuilder(consultations: _consultations, context: context),
//       ],
//     );
//   }
// }

// class AppointmentListBuilder extends StatelessWidget {
//   final List<Consultation> consultations;
//   final BuildContext context;

//   AppointmentListBuilder({super.key, required this.consultations, required this.context});

//   final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 1024;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: isMobile ? _buildCarouselSlider() : _buildListView(),
//         ),
//         const SizedBox(height: 10.0),
//         if (isMobile && consultations.length > 1)
//           Center(
//             child: ValueListenableBuilder<int>(
//               valueListenable: _currentIndex,
//               builder: (context, index, child) {
//                 return AnimatedSmoothIndicator(
//                   activeIndex: index,
//                   count: consultations.length,
//                   effect: ExpandingDotsEffect(
//                     dotHeight: 5,
//                     dotWidth: 5,
//                     activeDotColor: Theme.of(context).colorScheme.primary,
//                   ),
//                 );
//               },
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildCarouselSlider() {
//     return CarouselSlider(
//       items: consultations.map((consultation) => const AppointmentCard(appointment: [].to,)).toList(),
//       options: CarouselOptions(
//         viewportFraction: 1,
//         height: MediaQuery.of(context).size.height * 0.28,
//         enableInfiniteScroll: false,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 7),
//         onPageChanged: (index, reason) => _currentIndex.value = index,
//       ),
//     );
//   }

//   Widget _buildListView() {
//     final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
//     final widthFactor = isLandscape ? 0.69 : 0.44;

//     return SizedBox(
//       height: 220,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: consultations.length,
//         separatorBuilder: (context, index) => const SizedBox(width: 16.0),
//         itemBuilder: (context, index) {
//           return SizedBox(
//             width: MediaQuery.of(context).size.width * widthFactor / (isLandscape ? 2 : 1),
//             child: ClipRRect(borderRadius: BorderRadius.circular(16), child: const AppointmentCard()),
//           );
//         },
//       ),
//     );
//   }
// }

// class Consultation {
//   final String id;
//   final String title;
//   final String description;
//   final String image;

//   Consultation({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.image,
//   });
// }
