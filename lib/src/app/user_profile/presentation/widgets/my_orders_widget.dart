import 'package:flutter/material.dart';

class MyOrdersWidgetView extends StatelessWidget {
  const MyOrdersWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: orders.isEmpty
          ? const Center(child: Text('You haven\'t placed any order yet.'))
          : ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final Order order = orders[index];
                return OrderCard(order: order);
              },
            ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    Color statusColor = getColorBasedOnStatus(order.orderStatus);
    final theme = Theme.of(context);

    Item? item = order.items.isNotEmpty ? order.items.first : null;
    if (item == null) {
      return const SizedBox();
    }
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xffE5E5E5)),
        ),
        duration: const Duration(seconds: Duration.millisecondsPerSecond),
        child: InkWell(
          onTap: () {
            // Handle navigation to order details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const Placeholder(), // Replace with actual screen
              ),
            );
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/ecom.jpeg",
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
                      order.orderStatus,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            item.itemData.itemName,
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                        if (order.items.length > 1)
                          Text(
                            'and ${order.items.length - 1} more items',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      order.orderId,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${order.finalPrice.toStringAsFixed(2)} ${order.currency}',
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

class Order {
  final String orderId;
  final String orderStatus;
  final List<Item> items;
  final double finalPrice;
  final String currency;

  Order({
    required this.orderId,
    required this.orderStatus,
    required this.items,
    required this.finalPrice,
    required this.currency,
  });
}

class Item {
  final ItemData itemData;

  Item({required this.itemData});
}

class ItemData {
  final String itemName;
  final String itemImage;

  ItemData({
    required this.itemName,
    required this.itemImage,
  });
}

// Hardcoded sample orders
final List<Order> orders = [
  Order(
    orderId: '12345',
    orderStatus: 'PENDING',
    items: [
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 1',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
    ],
    finalPrice: 29.99,
    currency: 'USD',
  ),
  Order(
    orderId: '67890',
    orderStatus: 'ACCEPTED',
    items: [
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 2',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 3',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
    ],
    finalPrice: 49.99,
    currency: 'USD',
  ),
  Order(
    orderId: '67890',
    orderStatus: 'ACCEPTED',
    items: [
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 2',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 3',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
    ],
    finalPrice: 49.99,
    currency: 'USD',
  ),
  Order(
    orderId: '67890',
    orderStatus: 'ACCEPTED',
    items: [
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 2',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 3',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
    ],
    finalPrice: 49.99,
    currency: 'USD',
  ),
  Order(
    orderId: '67890',
    orderStatus: 'ACCEPTED',
    items: [
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 2',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 3',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
    ],
    finalPrice: 49.99,
    currency: 'USD',
  ),
  Order(
    orderId: '67890',
    orderStatus: 'ACCEPTED',
    items: [
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 2',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
      Item(
        itemData: ItemData(
          itemName: 'Sample Item 3',
          itemImage: 'https://via.placeholder.com/150',
        ),
      ),
    ],
    finalPrice: 49.99,
    currency: 'USD',
  ),
];
