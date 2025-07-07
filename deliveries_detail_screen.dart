import 'package:flutter/material.dart';

import 'package:ui/constants/colors.dart';
import 'package:ui/constants/icons.dart';
import 'package:ui/widgets/my_icon_box.dart';
import 'package:zuv_delivery_driver/model/index.dart';

class DeliveriesDetailScreen extends StatelessWidget {
  final DeliveryData deliveryData;
  const DeliveriesDetailScreen({super.key, required this.deliveryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: MyIconBox(icon: narrowArrow, color: primary, size: 24),
              ),
            ),
            title: const Text(
              "Хүргэлт дэлгэрэнгүй",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Delivery status
            _buildStatusSection(),
            const SizedBox(height: 12),

            // 2. Tracking information
            _buildTrackingSection(),
            const SizedBox(height: 12),

            // 3. Customer information
            _buildCustomerSection(),
            const SizedBox(height: 12),

            // 4. Address information
            _buildAddressSection(),
            const SizedBox(height: 12),

            // 5. Delivery details
            _buildDeliveryDetailsSection(),
            const SizedBox(height: 12),

            // 6. Payment information
            _buildPaymentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Төлөв",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: deliveryData.deliveryStatus.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  deliveryData.deliveryStatus.text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: deliveryData.deliveryStatus.color,
                  ),
                ),
              ),
            ],
          ),
          Icon(
            _getStatusIcon(deliveryData.deliveryStatus),
            size: 48,
            color: deliveryData.deliveryStatus.color,
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow("Мерчант", deliveryData.merchantName),
          const Divider(height: 24),
          _buildInfoRow("Хүргэлтийн код", deliveryData.trackingNumber),
          const Divider(height: 24),
          _buildInfoRow("Огноо", _formatDate(deliveryData.createdAt)),
        ],
      ),
    );
  }

  Widget _buildCustomerSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Хэрэглэгчийн мэдээлэл",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (deliveryData.customerName != null)
            _buildInfoRow("Нэр", deliveryData.customerName!),
          if (deliveryData.customerName != null) const Divider(height: 24),
          Row(
            children: [
              Icon(Icons.phone, size: 20, color: primary),
              const SizedBox(width: 12),
              Text(
                deliveryData.customerPhone,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // TODO: Implement phone call functionality
                },
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.call, size: 20, color: primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Хаягийн мэдээлэл",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (deliveryData.pickupAddress != null) ...[
            _buildAddressItem(
              icon: Icons.location_on_outlined,
              title: "Авах хаяг",
              address: deliveryData.pickupAddress!,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
          ],
          if (deliveryData.deliveryAddress != null)
            _buildAddressItem(
              icon: Icons.location_on,
              title: "Хүргэх хаяг",
              address: deliveryData.deliveryAddress!,
              color: Colors.green,
            ),
        ],
      ),
    );
  }

  Widget _buildDeliveryDetailsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Хүргэлтийн дэлгэрэнгүй",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow("Барааны тоо", "${deliveryData.deliveryCount} ширхэг"),
          const Divider(height: 24),
          _buildInfoRow(
            "Нийт дүн",
            "${_formatCurrency(deliveryData.totalAmount)} ₮",
            valueStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primary,
            ),
          ),
          if (deliveryData.deliveryDriverName != null) ...[
            const Divider(height: 24),
            _buildInfoRow("Жолооч", deliveryData.deliveryDriverName!),
          ],
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Төлбөрийн мэдээлэл",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow("Төлбөрийн төлөв", deliveryData.paymentStatus),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {TextStyle? valueStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: valueStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildAddressItem({
    required IconData icon,
    required String title,
    required String address,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 24, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                address,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getStatusIcon(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.pending:
        return Icons.hourglass_empty;
      case DeliveryStatus.verified:
        return Icons.verified;
      case DeliveryStatus.departed:
        return Icons.local_shipping;
      case DeliveryStatus.completed:
        return Icons.check_circle;
      case DeliveryStatus.cancelled:
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return "${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return dateString;
    }
  }

  String _formatCurrency(int amount) {
    final formatter = amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},');
    return formatter;
  }
}