import 'package:flutter/material.dart';

/// Widget for displaying delivery status badge
/// Works with any object that has .text and .color properties
class DeliveryStatusWidget extends StatelessWidget {
  final dynamic
  deliveryStatus; // Using dynamic to work with your existing model

  const DeliveryStatusWidget({super.key, required this.deliveryStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: deliveryStatus.color.withAlpha(25),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        deliveryStatus.text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: deliveryStatus.color,
        ),
      ),
    );
  }
}
