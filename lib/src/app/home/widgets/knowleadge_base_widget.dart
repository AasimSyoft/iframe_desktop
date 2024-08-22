import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class KnowledgeListView extends StatelessWidget {
  const KnowledgeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
        // boxShadow: AppConstants.kDefaultShadow,
      ),
      child: Column(
        children: [
          Container(
            height: 36,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.black),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Search articles...",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ListView.separated(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            separatorBuilder: (context, index) => Divider(
              height: 0,
              color: Colors.grey.shade200,
            ),
            itemBuilder: (context, index) {
              return buildTile();
            },
          ),
        ],
      ),
    );
  }

  Widget buildTile() => ListTile(
        title: const Text(
          "Sample Topic",
          style: TextStyle(
            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowRight01,
          color: Colors.black,
          size: 24.0,
        ),
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        onTap: () {},
      );
}
