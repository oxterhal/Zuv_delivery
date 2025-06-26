import 'package:flutter/material.dart';

class DeliveryAddressDetailsWidget extends StatelessWidget {
  final String? deliveryAddress;

  const DeliveryAddressDetailsWidget({super.key, this.deliveryAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on, size: 24, color: Colors.black54),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deliveryAddress ?? "Хаяг оруулаагүй",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
