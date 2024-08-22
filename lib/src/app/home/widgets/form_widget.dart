import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> with AutomaticKeepAliveClientMixin<FormWidget> {
  List<String> displayedForms = ['Form 1', 'Form 2'];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
                child: Text(
              "Forms",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            if (displayedForms.length > 2)
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  // _showViewAllBottomSheet(context);
                },
                child: const Text('View all'),
              ),
          ],
        ),
        const SizedBox(height: 10.0),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                // boxShadow: AppConstants.kDefaultShadow,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              "assets/images/ecom.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                displayedForms[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Fill out the form to provide us with some basic information',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          height: 25,
                          width: 25,
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            size: 12.0,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: displayedForms.length,
        ),
      ],
    );
  }

  // void _showViewAllBottomSheet(BuildContext context) {
  //   showCupertinoModalBottomSheet(
  //     context: context,
  //     builder: (context) => const AllFormsSheet(),
  //   );
  // }
}

class AllFormsSheet extends StatelessWidget {
  const AllFormsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> forms = ['Form 1', 'Form 2', 'Form 3', 'Form 4'];

    return Scaffold(
      appBar: AppBar(title: const Text("Hardcoded Header")),
      body: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
          // boxShadow: AppConstants.kDefaultShadow,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            final form = forms[index];
            return ListTile(
              title: Text(
                form,
                style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {},
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: Image.asset(
                    "assets/images/ecom.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.all(12.0),
            );
          },
          separatorBuilder: (context, index) => Divider(
            thickness: 3.0,
            color: Colors.grey.shade200,
            height: 0,
          ),
          itemCount: forms.length,
        ),
      ),
    );
  }
}
