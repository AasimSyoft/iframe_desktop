import 'package:flutter/material.dart';

import 'product_catagory_widget.dart';

class ServiceCategoryWidget extends StatelessWidget {
  const ServiceCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded data
    List<CategoryParams> params = List.generate(
      6,
      (index) => CategoryParams(
        id: 'id$index',
        name: 'Service Category $index',
        image: "assets/images/ecom.jpeg",
        onTap: () {
          // Handle onTap for hardcoded data
        },
        type: 'service',
        description: 'Description for Service Category $index',
        count: index * 5,
      ),
    );

    int maxCount = 2;
    int crossAxisCount = 2;

    return Column(
      children: [
        Row(
          children: [
            const Expanded(
                child: Text(
              "Services",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            if (params.length > 2)
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: const Text('View all'),
              ),
          ],
        ),
        const SizedBox(height: 10.0),
        CategoryListBuilder(
          params: params,
          isGrid: true,
          crossAxisCount: crossAxisCount,
          maxCount: maxCount,
        ),
      ],
    );
  }
}

class AllCategorySheet extends StatelessWidget {
  final List<CategoryParams> params;
  final String name;
  final int crossAxisCount;
  final bool isGrid;
  final String type;

  const AllCategorySheet({
    super.key,
    required this.params,
    required this.name,
    this.crossAxisCount = 2,
    this.isGrid = true,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CategoryListBuilder(
          params: params,
          isGrid: isGrid,
          crossAxisCount: crossAxisCount,
          maxCount: params.length,
        ),
      ),
    );
  }
}

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({
    super.key,
    required this.params,
    this.maxCount = 2,
    this.isGrid = true,
    this.crossAxisCount = 2,
  });

  final int crossAxisCount;
  final bool isGrid;
  final int maxCount;
  final List<CategoryParams> params;

  Widget _buildGridView(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final itemHeight = size.width / crossAxisCount;
    // final itemWidth = size.width / crossAxisCount;
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, childAspectRatio: 3 / 3),
      itemCount: params.length > maxCount ? maxCount : params.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final param = params[index];
        return CategoryCard(param: param);
      },
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: params.length > maxCount ? maxCount : params.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final param = params[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: () => param.onTap(),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          param.image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            param.name,
                            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                          if (param.description != null && param.description!.isNotEmpty)
                            Text(
                              param.description ?? '',
                              style: const TextStyle(color: Colors.grey),
                              maxLines: 2,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (param.count > 0)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                              margin: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                '${param.count} items',
                                style: const TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          const SizedBox(height: 30),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            height: 25,
                            width: 25,
                            padding: const EdgeInsets.all(5.0),
                            child: const Icon(
                              Icons.arrow_outward_rounded,
                              size: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isGrid ? _buildGridView(context) : _buildList();
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryParams param;
  const CategoryCard({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () => param.onTap(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      param.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  param.name,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                if (param.description != null && param.description!.isNotEmpty)
                  Text(
                    param.description ?? '',
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 2,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
