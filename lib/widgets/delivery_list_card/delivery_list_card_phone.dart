import 'package:flutter/material.dart';

/// Widget for displaying customer phone number in delivery card
class DeliveryPhoneWidget extends StatelessWidget {
  final String phoneNumber;

  const DeliveryPhoneWidget({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.phone, size: 16, color: Color(0xffFC6A31)),
        const SizedBox(width: 8),
        Text(
          phoneNumber,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xffFC6A31),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
