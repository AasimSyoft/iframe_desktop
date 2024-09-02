import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iframe_desktop/src/features/checkout/widgets/add_address_widget.dart';
import 'package:iframe_desktop/src/features/product/providers/address_provider.dart';

import '../../../app/routes/app_router.dart';

class CheckoutView extends ConsumerWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressAsyncValue = ref.watch(addressProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Checkout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildPaymentOption('Online Payment'),
            const SizedBox(height: 10),
            _buildPaymentOption('Pay later'),
            const SizedBox(height: 20),

            // Delivery Address Section
            const Text(
              'Delivery Address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Delivery Address',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: () {
                    _showAddAddressDialog(context);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 10),
            addressAsyncValue.when(
              data: (addressModel) {
                if (addressModel == null ||
                    addressModel.data == null ||
                    addressModel.data!.isEmpty) {
                  return const Text('No address available.');
                }
                final address = addressModel
                    .data!.first; // Assuming you want the first address
                return _buildDeliveryAddress(
                  name: address.name ?? 'No Name',
                  addressLine1: address.addressOne ?? 'No Address',
                  city: address.city ?? 'No City',
                  country: address.country ?? 'No Country',
                  postalCode: address.zipcode ?? 'No Postal Code',
                  contactNumber: address.phoneNumber ?? 'No Contact Number',
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Text('Error fetching address: $error'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Use Shipping Address as Billing Address',
                  style: TextStyle(fontSize: 16),
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
            const Divider(height: 30),

            const Spacer(),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cart Total',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Items'),
                      // Text('${cart.length}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal'),
                      // Text('¥${calculateSubtotal(cart)}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discount'),
                      // Text('- ¥${calculateDiscount(cart)}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax'),
                      // Text('sgst (2.6%) ¥${calculateTax(cart)}'),
                    ],
                  ),
                  const Divider(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   // '¥${calculateTotal(cart)}',
                      //   style: const TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(Routes.success);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Confirm Order',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(fontSize: 16)),
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildDeliveryAddress({
    required String name,
    required String addressLine1,
    required String city,
    required String country,
    required String postalCode,
    required String contactNumber,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  addressLine1,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  '$city, $country',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  postalCode,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  contactNumber,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Logic for changing the delivery address
              },
              child: const Text(
                'Change',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showAddAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddCompanyFormDialog();
      },
    );
  }
}
