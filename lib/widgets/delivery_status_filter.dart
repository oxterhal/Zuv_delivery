import 'package:flutter/material.dart';

class DeliveryStatusFilter extends StatelessWidget {
  final String selectedStatus;
  final Function(String) onStatusChanged;

  const DeliveryStatusFilter({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  static const List<Map<String, String>> _filterOptions = [
    {"label": "Бүгд", "value": "Бүгд"},
    {"label": "Хүлээгдэж буй", "value": "pending"},
    {"label": "Баталгаажсан", "value": "verified"},
    {"label": "Үүссэн", "value": "departed"},
    {"label": "Дууссан", "value": "completed"},
    {"label": "Цуцлагдсан", "value": "cancelled"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            _filterOptions
                .map(
                  (option) =>
                      _buildFilterChip(option["label"]!, option["value"]!),
                )
                .toList(),
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final bool selected = selectedStatus == value;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () => onStatusChanged(value),
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? Color(0xffFC6A31) : Color(0xffD7DBEA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Color(0xff181C24).withAlpha(50),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
