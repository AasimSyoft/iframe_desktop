import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/order.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/my_orders_provider.dart';

class MyOrdersWidgetView extends ConsumerWidget {
  const MyOrdersWidgetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the ordersProvider to get the current state
    final ordersAsyncValue = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Orders',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: ordersAsyncValue.when(
        data: (ordersModel) {
          final orders =
              ordersModel.data; // Assuming OrdersModel has an orders property
          return orders!.isEmpty
              ? const Center(child: Text('You haven\'t placed any order yet.'))
              : ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  padding: const EdgeInsets.all(16),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final Order order = orders[index];
                    return OrderCard(order: order);
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

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    Color statusColor = getColorBasedOnStatus(order.orderStatus ?? '');
    final theme = Theme.of(context);

    String imageUrl = order.items?.first.itemData?.itemImage ?? '';

    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xffE5E5E5)),
        ),
        duration: const Duration(milliseconds: 300),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: imageUrl.startsWith('http')
                    ? Image.network(
                        order.items?.first.itemData?.itemImage ?? '',
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      )
                    : Image.asset(
                        order.items?.first.itemData?.itemImage ?? '',
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderStatus ?? '',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            order.items?.first.itemData?.itemName ?? '',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                        if (order.items!.length > 1)
                          Text(
                            'and ${order.items!.length - 1} more items',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      order.orderId ?? '',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${order.finalPrice!.toStringAsFixed(2)} ${order.currency}',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColorBasedOnStatus(String status) {
    switch (status) {
      case 'PENDING':
        return Colors.orange;
      case 'ACCEPTED':
        return Colors.green;
      case 'REJECTED':
        return Colors.red;
      case 'REFUNDED':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }
}
