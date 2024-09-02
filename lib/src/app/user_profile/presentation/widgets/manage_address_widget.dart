import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/order.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/my_orders_provider.dart';

class ManageAddressWidgetView extends ConsumerWidget {
  const ManageAddressWidgetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsyncValue = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Shipping Address',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle navigation to AddNewAddress
            },
            icon: const Icon(Icons.add),
            tooltip: 'Add new address',
          ),
        ],
      ),
      body: ordersAsyncValue.when(
        data: (ordersModel) {
          final addresses = ordersModel.data
                  ?.where((order) => order.shippingAddress != null)
                  .map((order) => order.shippingAddress!)
                  .toList() ??
              [];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 160, left: 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Delivery Address',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        addresses.isEmpty
                            ? const Text(
                                'You have not added any address yet. Please add a new address.',
                                style: TextStyle(color: Colors.black),
                              )
                            : ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: addresses.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (_, index) =>
                                    Divider(color: Colors.grey.shade200),
                                itemBuilder: (context, index) {
                                  final IngAddress address = addresses[index];
                                  return AddressCard(address: address);
                                },
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // OutlinedButton(
                  //   style: OutlinedButton.styleFrom(
                  //     side: const BorderSide(color: Colors.brown),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     minimumSize: const Size.fromHeight(45),
                  //   ),
                  //   onPressed: () {
                  //     // Handle navigation to AddNewAddress
                  //   },
                  //   child: const Text(
                  //     'Add new address',
                  //     style: TextStyle(color: Colors.brown),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final IngAddress address;
  final bool isFromOrderSummary;

  const AddressCard({
    super.key,
    required this.address,
    this.isFromOrderSummary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              address.contactPersonName ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            if (!isFromOrderSummary &&
                address.addressType == 'SHIPPING_ADDRESS')
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Default',
                  style: TextStyle(color: Colors.brown, fontSize: 12),
                ),
              ),
          ],
        ),
        Text(
          '${address.name ?? ''}, ${address.addressOne ?? ''}, ${address.addressTwo ?? ''}\n${address.city ?? ''}, ${address.state ?? ''}, ${address.country ?? ''}\n${address.zipcode ?? ''}',
        ),
        Text(
          address.contactPersonPhone ?? '',
        ),
        Visibility(
          visible: !isFromOrderSummary,
          child: Row(
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  // Handle edit address
                },
                icon: const Icon(Icons.edit, size: 15, color: Colors.brown),
                label: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
              const SizedBox(width: 10),
              TextButton.icon(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  // Handle address deletion
                },
                icon: const Icon(Icons.delete, size: 15, color: Colors.brown),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
              const SizedBox(width: 10),
              if (address.addressType != 'BILLING_ADDRESS')
                TextButton.icon(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    // Handle setting address as default
                  },
                  label: const Text(
                    'Set as default',
                    style: TextStyle(color: Colors.brown),
                  ),
                  icon: const Icon(Icons.check, size: 15),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
