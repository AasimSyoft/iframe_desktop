import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/order.dart'; // Ensure this import includes OrderItemCard
import 'package:intl/intl.dart';

class MyOrderDetailsView extends StatelessWidget {
  final Order order;
  const MyOrderDetailsView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    print('Order data: ${order.toJson()}');

    final DateFormat dateFormat = DateFormat('yyyy-MM-dd | hh:mm a');
    final theme = Theme.of(context);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: order.items?.length ?? 0,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey.shade200),
                itemBuilder: (context, index) {
                  final Item item = order.items![index];
                  return OrderItemCard(item: item);
                },
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade200),
              const SizedBox(height: 10),
              buildDetails('Order id', order.orderId ?? ''),
              const SizedBox(height: 10),
              buildDetails(
                  'Order date',
                  dateFormat
                      .format(order.createdAt?.toLocal() ?? DateTime.now())),
              const SizedBox(height: 10),
              buildDetails(
                'Order status',
                order.orderStatus ?? '',
                color: getColorBasedOnStatus(order.orderStatus ?? ''),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade200),
              const SizedBox(height: 10),
              buildDetails(
                'Total items',
                order.items?.length.toString() ?? '',
              ),
              const SizedBox(height: 10),
              buildDetails(
                'Subtotal',
                '${order.totalPrice ?? 0.0} ${order.currency ?? ''}',
              ),
              const SizedBox(height: 10),
              buildDetails(
                'Discount',
                '- ${order.discountPrice ?? 0.0} ${order.currency ?? ''}',
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              DottedLine(dashColor: Colors.grey.shade200),
              const SizedBox(height: 10),
              buildDetails(
                'Total',
                '${order.finalPrice ?? 0.0} ${order.currency ?? ''}',
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade200),
              const SizedBox(height: 10),
              buildDetails(
                'Payment method',
                order.paymentType?.replaceAll('_', '') ?? '',
              ),
              const SizedBox(height: 10),
              buildDetails(
                'Payment status',
                order.paymentStatus?.replaceAll('_', '') ?? '',
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade200),
              const SizedBox(height: 10),
              Text('Shipping Address',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                '${order.shippingAddress?.contactPersonName ?? ''},\n${order.shippingAddress?.contactPersonPhone ?? ''},\n${order.shippingAddress?.name ?? ''}, ${order.shippingAddress?.addressOne ?? ''}, ${order.shippingAddress?.addressTwo ?? ''},\n${order.shippingAddress?.city ?? ''}, ${order.shippingAddress?.state ?? ''}, ${order.shippingAddress?.country ?? ''} - ${order.shippingAddress?.zipcode ?? ''}',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade200),
              const SizedBox(height: 10),
              Text('Billing Address',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                '${order.billingAddress?.contactPersonName ?? ''},\n${order.billingAddress?.contactPersonPhone ?? ''},\n${order.billingAddress?.name ?? ''}, ${order.billingAddress?.addressOne ?? ''}, ${order.billingAddress?.addressTwo ?? ''},\n${order.billingAddress?.city ?? ''}, ${order.billingAddress?.state ?? ''}, ${order.billingAddress?.country ?? ''} - ${order.billingAddress?.zipcode ?? ''}',
                style: theme.textTheme.bodyMedium,
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

  Widget buildDetails(String title, String value,
      {Color? color, Widget? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.grey.shade700, fontWeight: FontWeight.bold),
        ),
        trailing ??
            Text(
              value,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: -0.3,
                color: color ?? const Color(0xff14353C),
              ),
            ),
      ],
    );
  }
}

class OrderItemCard extends StatelessWidget {
  final Item item;

  const OrderItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: item.itemData?.itemImage != null
            ? Image.network(
                item.itemData!.itemImage!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : Container(
                width: 50,
                height: 50,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
        title: Text(
          item.itemData?.itemName ?? 'No Name',
        ),
        subtitle: Text(
          '${item.quantity ?? 0} x ${item.itemData?.price ?? 0.0}',
        ),
        trailing: Text(
          '${(item.quantity ?? 0) * (item.itemData?.price ?? 0.0)} ${item.itemData?.itemTotalDiscountedPrice ?? ''}',
        ),
      ),
    );
  }
}
