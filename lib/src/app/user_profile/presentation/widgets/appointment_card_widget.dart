import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentCardGrid extends StatelessWidget {
  final List<AppointmentCard> appointments;

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
        return appointments[index];
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final bool isShowButton;

  const AppointmentCard({
    super.key,
    this.isShowButton = true,
  });

  @override
  Widget build(BuildContext context) {
    // final ColorScheme colorScheme = Theme.of(context).colorScheme;
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
                    // color: Colors.grey.shade300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/ecom.jpeg",
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
                          'Consultation Name',
                          style: GoogleFonts.inter(
                            fontSize: 16, // Reduced font size
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Consultation description goes here',
                          style: GoogleFonts.inter(
                            fontSize: 11, // Reduced font size
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
                                  fontSize: 11,
                                  color: Colors.grey), // Reduced font size
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '\$100',
                              style: GoogleFonts.inter(
                                fontSize: 14, // Reduced font size
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
                    padding: const EdgeInsets.all(8), // Reduced padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '• Available Online, In-Person',
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Colors.black), // Reduced font size
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '• 30 min Duration',
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Colors.black), // Reduced font size
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8), // Reduced spacing
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
                        minimumSize:
                            const Size(double.infinity, 36.0), // Adjusted size
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
                        side:
                            BorderSide(color: Colors.grey.shade600, width: 0.5),
                        foregroundColor: Colors.grey.shade600,
                      ),
                      onPressed: () {},
                      child: const Text('View Details'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
