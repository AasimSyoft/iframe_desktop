import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/service.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/my_service_provider.dart';
import 'package:intl/intl.dart';

class ClientProjectsView extends ConsumerWidget {
  const ClientProjectsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientProjectsAsyncValue = ref.watch(clientProjectsProvider);

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
      body: clientProjectsAsyncValue.when(
        data: (clientProjectsModel) {
          final projects = clientProjectsModel.data ?? [];

          if (projects.isEmpty) {
            return Center(
              child: Text(
                'No services available',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return ProjectCard(project: project);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ClientProjects project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AnimatedContainer(
        margin: const EdgeInsets.all(8),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          minLeadingWidth: 0,
          contentPadding: const EdgeInsets.only(
            right: 20,
          ),
          leading: Container(
            width: 5,
            height: double.infinity,
            decoration: BoxDecoration(
              color: getColorForStatus(project.projectStatus ?? ''),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          title: AnimatedDefaultTextStyle(
            style: theme.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold, color: colorScheme.primary),
            duration: const Duration(milliseconds: 150),
            child: Text(project.name ?? 'N/A'),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Owner  :  ',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Text(
                    '${project.ownerInfo?.fname ?? 'N/A'} ${project.ownerInfo?.lname ?? 'N/A'}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Budget :  ',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Text(
                    '${project.cost} ${project.currency}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                project.projectStatus ?? 'N/A',
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: getColorForStatus(project.projectStatus ?? '')),
              ),
              const SizedBox(height: 5),
              if (project.dueDate != null)
                Text(DateFormat('yyyy-MM-dd').format(project.dueDate!)),
            ],
          ),
          onTap: () {
            // Implement navigation or other actions
          },
        ),
      ),
    );
  }

  Color getColorForStatus(String status) {
    switch (status) {
      case 'PENDING':
        return Colors.orange;
      case 'COMPLETED':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
