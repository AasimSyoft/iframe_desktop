import 'package:flutter/material.dart';

class AddCompanyFormDialog extends StatelessWidget {
  const AddCompanyFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            // height: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add Address",
                      style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.cancel))
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(child: _buildTextField('Full Name *', 'Company Name', 'Full Name')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildTextField('Address', 'Website', 'Enter  Address')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField('Address 1', 'Email', 'Enter Address 1')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildPhoneNumberField('Mobile Number', '+1', 'Enter Number')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField('Address 2', 'Address', 'Enter Address 2')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildTextField('Town/City', 'City', 'Enter Town/City')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField('Zip Code', 'Zip Code', 'Enter Email')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildTextField('Select Country', 'Contact Name', 'Select Country')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField('Contact Name', 'Contact Name', 'Enter Email')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildTextField('State', 'Contact Email', 'Enter State Name')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField(' Pin code', 'Phone Number', 'Enter Pin code')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildTextField('Landmark', 'Linkedin', 'Enter Nearest Landmark')),
                  ],
                ),
                const SizedBox(height: 20),
                _buildBottomButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, String topText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(topText, style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8.0),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumberField(String label, String prefix, String topText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(topText, style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8.0),
              prefixText: prefix,
            ),
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Save Address',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
